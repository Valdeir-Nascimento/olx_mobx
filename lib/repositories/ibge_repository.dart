import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:olxmobx/models/cidade_model.dart';
import 'package:olxmobx/models/estado_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IBGERepository {
  
  Future<List<EstadoModel>> getEstados() async {
    final prefs = await SharedPreferences.getInstance();
    //Carregandos os dados em cache
    if(prefs.containsKey("UF_LIST")) {
      print("FOUND CACHE");
      final dadosJson = json.decode(prefs.getString("UF_LIST"));
      return dadosJson.map<EstadoModel>((json) => EstadoModel.fromJson(json))
        .toList()..sort((EstadoModel a, EstadoModel b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()));
    }

    const endPoint = "https://servicodados.ibge.gov.br/api/v1/localidades/estados";
    print("NOT FOUND ON CACHE");
    try {
      final response =  await Dio().get<List>(endPoint);

      prefs.setString("UF_LIST", json.encode(response.data));

      final List<EstadoModel> estados = response.data.map<EstadoModel>((json) => EstadoModel.fromJson(json))
        .toList()..sort((a,b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()));
      return estados;

    } on DioError {
      return Future.error("Falha ao obter lista de estados.");
    }
  }

  Future<List<CidadeModel>> getCidades(EstadoModel estado) async {

    try {
      final String endPoint = "https://servicodados.ibge.gov.br/api/v1/localidades/estados/${estado.id}/municipios";
      final response = await Dio().get<List>(endPoint);
      final List<CidadeModel> cidades = response.data.map<CidadeModel>((json) => CidadeModel.fromJson(json))
        .toList()..sort((a,b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()));
      return cidades;
    } on DioError {
      return Future.error("Falha ao obter lista de cidades");
    }

  }
}
