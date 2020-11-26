class EstadoModel {
  int id;
  String sigla;
  String nome;
  EstadoModel({
    this.id,
    this.sigla,
    this.nome,
  });

  factory EstadoModel.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return EstadoModel(
      id: map['id'],
      sigla: map['sigla'],
      nome: map['nome'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sigla': sigla,
      'nome': nome,
    };
  }

  @override
  String toString() => 'EstadoModel(id: $id, sigla: $sigla, nome: $nome)';
}
