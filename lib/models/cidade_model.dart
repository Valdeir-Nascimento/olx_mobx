class CidadeModel {
  int id;
  String nome;
  CidadeModel({
    this.id,
    this.nome,
  });

  factory CidadeModel.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return CidadeModel(
      id: map['id'],
      nome: map['nome'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }
  
  @override
  String toString() => 'CidadeModel(id: $id, nome: $nome)';
}
