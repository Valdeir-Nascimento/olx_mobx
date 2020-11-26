import 'package:dio/dio.dart';
import 'package:olxmobx/models/cidade_model.dart';
import 'package:olxmobx/models/endereco_model.dart';
import 'package:olxmobx/repositories/ibge_repository.dart';

class CepRepository {
  Future<EnderecoModel> getCep(String cep) async {
    if (cep == null || cep.isEmpty) {
      return Future.error("CEP Inválido.");
    }

    final cleanCep = cep.replaceAll(RegExp("[^0-9]"), "");
    if(cleanCep.length != 8) {
      return Future.error("CEP Inválido.");
    }

    final endPoint = "https://viacep.com.br/ws/$cleanCep/json/";


    try {
     
      final response = await Dio().get<Map>(endPoint);
      // print("RESPONSE ${response.data}");
      if(response.data.containsKey('erro') && response.data['erro']){
        return Future.error("CEP Inválido.");
      }

      final estados = await IBGERepository().getEstados();
      // print("Estados $estados");
      // print("RESPONSE 2 ${estados.firstWhere((estado) => estado.sigla == response.data['uf'])}");

      return EnderecoModel(
        cep: response.data['cep'],
        bairro: response.data['bairro'],
        cidade: CidadeModel(nome: response.data['localidade']),
        estado: estados.firstWhere((estado) => estado.sigla == response.data['uf']),
      );
    } catch (e) {
      Future.error("Falha ao buscar CEP.");
      
    }


  }
}
