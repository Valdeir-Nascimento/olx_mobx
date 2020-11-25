import 'package:dio/dio.dart';
import 'package:olxmobx/models/estado_model.dart';

class IBGERepository {
  
  Future<List<EstadoModel>> getEstados() async {
    const endPoint = "https://servicodados.ibge.gov.br/api/v1/localidades/estados";

    try {
      final response =  await Dio().get<List>(endPoint);
      final List<EstadoModel> estados = response.data.map<EstadoModel>((json) => EstadoModel.fromJson(json))
        .toList()..sort((a,b) => a.nome.toLowerCase().compareTo(b.nome.toLowerCase()));
      return estados;
    } on DioError {
      return Future.error("Falha ao obter lista de estados.");
    }


  }

  getCidades(){

  }
}
