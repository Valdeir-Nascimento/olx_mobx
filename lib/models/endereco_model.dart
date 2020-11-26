import 'package:olxmobx/models/cidade_model.dart';
import 'package:olxmobx/models/estado_model.dart';

class EnderecoModel {
  
  EstadoModel estado;
  CidadeModel cidade;
  String cep;
  String bairro;

  EnderecoModel({
    this.estado,
    this.cidade,
    this.cep,
    this.bairro,
  });




  @override
  String toString() {
    return 'EnderecoModel(estado: $estado, cidade: $cidade, cep: $cep, bairro: $bairro)';
  }
}
