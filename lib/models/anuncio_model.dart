import 'package:olxmobx/enums/status_anuncio_enum.dart';
import 'package:olxmobx/models/category_model.dart';
import 'package:olxmobx/models/cidade_model.dart';
import 'package:olxmobx/models/endereco_model.dart';
import 'package:olxmobx/models/estado_model.dart';
import 'package:olxmobx/models/user_model.dart';
import 'package:olxmobx/repositories/table_keys.dart';
import 'package:olxmobx/repositories/user_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class AnuncioModel {

  String id; //Id no parseServer
  List images;
  String title;
  String descricao;
  CategoryModel category;
  EnderecoModel endereco;
  num preco;
  bool hidePhone;

  StatusAnuncioEnum status = StatusAnuncioEnum.PENDENTE;
  DateTime created;
  UserModel user;
  int views;

  AnuncioModel();

  AnuncioModel.fromParse(ParseObject parseObject) {
    id = parseObject.objectId;
    title = parseObject.get<String>(keyAnuncioTitle);
    descricao = parseObject.get<String>(keyAnuncioDescription);
    images = parseObject.get<List>(keyAnuncioImages).map((img) => img.url).toList();
    hidePhone = parseObject.get<bool>(keyAnuncioHidePhone);
    preco = parseObject.get<num>(keyAnuncioPrice);
    created = parseObject.createdAt;
    endereco = EnderecoModel(
      bairro: parseObject.get<String>(keyAnuncioDistrict),
      cep: parseObject.get<String>(keyAnuncioPostalCode),
      estado: EstadoModel(sigla: parseObject.get(keyAnuncioFederativeUnit)),
      cidade: CidadeModel(nome: parseObject.get(keyAnuncioCity))
    );
    views = parseObject.get<int>(keyAnuncioViews, defaultValue: 0);
    user = UserRepository().mapParseToUser(parseObject.get<ParseUser>(keyAnuncioOwner));
    category = CategoryModel.fromParse(parseObject.get<ParseObject>(keyAnuncioCategory));
    status = StatusAnuncioEnum.values[parseObject.get<int>(keyAnuncioStatus)];
  }


}
