import 'dart:io';

import 'package:olxmobx/models/anuncio_model.dart';
import 'package:olxmobx/repositories/parse_errors.dart';
import 'package:olxmobx/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:path/path.dart' as path;

class AnuncioRepository {
  Future<AnuncioModel> salvar(AnuncioModel anuncio) async {

    try{
      
      final parseImages = await salvarImagens(anuncio.images);

      // final parseUser = ParseUser('','','')..set(keyUserId, anuncio.user.id);
      final parseUser = await ParseUser.currentUser();

      final anuncioParseObject = ParseObject(keyAnuncioTable);

      //Setando as permnissões 
      final parseACL = ParseACL(owner: parseUser);
      parseACL.setPublicReadAccess(allowed: true);
      parseACL.setPublicWriteAccess(allowed: false);
      anuncioParseObject.setACL(parseACL);

      anuncioParseObject.set<String>(keyAnuncioTitle, anuncio.title);
      anuncioParseObject.set<String>(keyAnuncioDescription, anuncio.descricao);
      anuncioParseObject.set<bool>(keyAnuncioHidePhone, anuncio.hidePhone);
      anuncioParseObject.set<num>(keyAnuncioPrice, anuncio.preco);
      anuncioParseObject.set<int>(keyAnuncioStatus, anuncio.status.index);

      anuncioParseObject.set<String>(keyAnuncioDistrict, anuncio.endereco.bairro);
      anuncioParseObject.set<String>(keyAnuncioCity, anuncio.endereco.cidade.nome);
      anuncioParseObject.set<String>(keyAnuncioFederativeUnit, anuncio.endereco.estado.sigla);
      anuncioParseObject.set<String>(keyAnuncioPostalCode, anuncio.endereco.cep);

      anuncioParseObject.set<List<ParseFile>>(keyAnuncioImages, parseImages);
      anuncioParseObject.set(keyAnuncioOwner, parseUser);
      
      //Vinculando categoria ao anuncio
      anuncioParseObject.set<ParseObject>(keyAnuncioCategory, ParseObject(keyCategoryTable)..set(keyCategoryId, anuncio.category.id));

      final response = await anuncioParseObject.save();
      if(response.success) {
        return AnuncioModel.fromParse(response.result);
      } else {
        return Future.error(ParseErrors.getDescription(response.error.code));
      }

    } catch (e) {
      return Future.error("Falha ao salvar anúncio");
    }

  }

  Future<List<ParseFile>> salvarImagens(List images) async {
    final parseImages = <ParseFile>[];

    try {
      for (var imagem in images) {
        if (imagem is File) {
          final parseFile = ParseFile(imagem, name: path.basename(imagem.path));
          final response = await parseFile.save();
          if (!response.success) {
            Future.error(ParseErrors.getDescription(response.error.code));
          }
          parseImages.add(parseFile);
        } else {
          final parseFile = ParseFile(null);
          parseFile.name = path.basename(imagem);
          parseFile.url = imagem;
          parseImages.add(parseFile);
        }
      }
      return parseImages;
    } catch (e) {
      return Future.error("Falha ao salvar imagens");
    }
  }
}
