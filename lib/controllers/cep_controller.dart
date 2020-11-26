import 'package:mobx/mobx.dart';
import 'package:olxmobx/models/endereco_model.dart';
import 'package:olxmobx/repositories/cep_repository.dart';
part 'cep_controller.g.dart';

class CepController = _CepControllerBase with _$CepController;

abstract class _CepControllerBase with Store {

  _CepControllerBase() {
    autorun((_) {
      if(clearCep.length != 8) {
        _reset();
      } else {
        _buscarCep();
      }
    });
  }

  @observable
  String cep = "";

  @observable
  EnderecoModel endereco;

  @observable
  String error;

  @observable
  bool loading = false;

  @action
  void setCep(String value) => cep = value;

  @computed
  String get clearCep => cep.replaceAll(RegExp("[^0-9]"), "");

  @action
  Future<void> _buscarCep() async {
    loading = true;
    try {
      endereco = await CepRepository().getCep(clearCep);
      error = null;
    }catch (e) {
      error = e;
      endereco = null;
    }
    loading = false;

  }

  @action
  _reset() {
    endereco = null;
    error = null;
  }


}
