import 'package:olxmobx/enums/user_type.dart';
import 'package:olxmobx/models/user_model.dart';
import 'package:olxmobx/repositories/parse_errors.dart';
import 'package:olxmobx/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserRepository {
  Future<UserModel> signUp(UserModel user) async {
    final parserUser = ParseUser(user.email, user.senha, user.email);

    parserUser.set<String>(keyUserName, user.nome);
    parserUser.set<String>(keyUserPhone, user.telefone);
    parserUser.set(keyUserType, user.type.index);

    //Criando usuário no parse server
    final response = await parserUser.signUp();
    if (response.success) {
      //print("RESULT: ${response.result}");
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  //Transformando ParseUser em um objeto UserModel
  UserModel mapParseToUser(ParseUser parseUser) {
    return UserModel(
      id: parseUser.objectId,
      nome: parseUser.get(keyUserName),
      email: parseUser.get(keyUserEmail),
      telefone: parseUser.get(keyUserPhone),
      type: UserType.values[parseUser.get(keyUserType)],
      createdAt: parseUser.get(keyUserCreatedAt),
    );
  }

  //Realizando o login no ParseServer
  //No lugar do username passamos o email
  Future<UserModel> loginWithEmail(String email, String senha) async {
    final parserUser = ParseUser(email, senha, null);

    final response = await parserUser.login();
    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  //Carregando ultimo login
  Future<UserModel> currentUser() async {
    final parserUser = await ParseUser.currentUser();
    if(parserUser != null) {
      final response = await ParseUser.getCurrentUserFromServer(parserUser.sessionToken);
      if(response.success) {
        return mapParseToUser(response.result);
      } else {
        await parserUser.logout();
      }
    }
    return null;
  }

}
