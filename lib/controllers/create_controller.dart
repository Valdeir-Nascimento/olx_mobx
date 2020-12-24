import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olxmobx/controllers/cep_controller.dart';
import 'package:olxmobx/controllers/user_manager_controller.dart';
import 'package:olxmobx/models/anuncio_model.dart';
import 'package:olxmobx/models/endereco_model.dart';
import 'package:olxmobx/repositories/anuncio_repository.dart';

import '../models/category_model.dart';

part 'create_controller.g.dart';

class CreateController = _CreateControllerBase with _$CreateController;

abstract class _CreateControllerBase with Store {
  ObservableList images = ObservableList();

  @observable
  CategoryModel category;

  @observable
  bool hidePhone = false;

  @observable
  bool showErros = false;

  @observable
  String title = "";

  @observable
  String description = "";
  
  @observable
  String precoText = "";

  @observable
  bool loading = false;

  @observable
  String error;

  @observable
  bool anuncioSalvo = false;

  CepController cepController = CepController();

  @action
  void setTitle(String value) => title = value;

  @action
  void setDescricao(String value) => description = value;

  @action
  void setCategory(CategoryModel value) => category = value;

  @action
  void setHidePhone(bool value) => hidePhone = value;

  @action
  void setPreco(String value) => precoText = value;

  @action
  void invalidSendPressed() => showErros = true;

  @computed
  bool get imagesValid => images.isNotEmpty;
  String get imagesError {
    if( !showErros || imagesValid) {
      return null;
    } else {
      return "Insira as imagens";
    }
  }

  @computed
  bool get titleValid => title.length >= 6;
  String get titleError {
    if( !showErros || titleValid){
      return null;
    } else if(title.isEmpty) {
      return "Campo obrigatório";
    } else {
      return "Titulo muito curto";
    }
  }

  @computed
  bool get descricaoValid => description.length >= 10;
  String get descricaoError {
    if(!showErros || descricaoValid) {
      return null;
    } else if (description.isEmpty){
      return "Campo obrigatório";
    } else {
      return "Descrição muito curta";
    }
  }

  @computed
  bool get categoryValid => category != null;
  String get categoryError {
    if(!showErros || categoryValid) {
      return null;
    } else {
      return "Campo obrigatório";
    }
  }

  @computed
  EnderecoModel get endereco => cepController.endereco;
  bool get enderecoValid => endereco != null;
  String get enderecoError {
    if(!showErros || enderecoValid){
      return null;
    } else {
      return "Campo obrigatório";
    }
  }

  @computed
  num get preco {
    if(precoText.contains(",")) {
      return num.tryParse(precoText.replaceAll(RegExp("[^0-9]"), ""))/100;
    } else {
      return num.tryParse(precoText);
    }
  }  

  @computed
  bool get precoValid => preco != null && preco <= 99999999;
  String get precoError {
    if(!showErros || precoValid) {
      return null;
    } else if (precoText.isEmpty) {
      return "Campo obrigatório";
    } else {
      return "Preço inválido.";
    }
  }

  @computed
  bool get formValid => imagesValid && descricaoValid && categoryValid && enderecoValid && precoValid && titleValid;

  @computed
  Function get sendPressed => formValid ? _send : null;

  @action
  Future<void> _send() async {
    final anuncio = AnuncioModel();
    anuncio.title = title;
    anuncio.descricao = description;
    anuncio.category = category;
    anuncio.preco = preco;
    anuncio.hidePhone = hidePhone;
    anuncio.images = images;
    anuncio.endereco = endereco;
    anuncio.user = GetIt.I.get<UserManagerController>().user;

    loading = true;
    try {
      await AnuncioRepository().salvar(anuncio);
      anuncioSalvo = true;
    } catch (e) {
      error = e;
    }
    loading = false;

  }
  
}
