class EstadoModel {
  int id;
  String initials;
  String nome;
  EstadoModel({
    this.id,
    this.initials,
    this.nome,
  });

  factory EstadoModel.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return EstadoModel(
      id: map['id'],
      initials: map['initials'],
      nome: map['nome'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'initials': initials,
      'nome': nome,
    };
  }

  @override
  String toString() => 'EstadoModel(id: $id, initials: $initials, nome: $nome)';
}
