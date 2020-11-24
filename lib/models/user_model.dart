import 'package:olxmobx/enums/user_type.dart';

class UserModel {
  
  String id;
  String nome;
  String email;
  String telefone;
  String senha;
  UserType type;
  DateTime createdAt;

  UserModel({
    this.id,
    this.nome,
    this.email,
    this.telefone,
    this.senha,
    this.type = UserType.PARTICULAR,
    this.createdAt,
  });

  @override
  String toString() {
    return 'UserModel(id: $id, nome: $nome, email: $email, telefone: $telefone, senha: $senha, type: $type, createdAt: $createdAt)';
  }
}
