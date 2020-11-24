import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olxmobx/controllers/user_manager_controller.dart';
import 'package:olxmobx/helpers/extensions.dart';
import 'package:olxmobx/repositories/user_repository.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  String email;

  @observable
  String password;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError => email == null || emailValid ? null : 'E-mail inválido';

  @computed
  bool get passwordValid => password != null && password.length >= 4;
  String get passwordError => password == null || passwordValid ? null : 'Senha inválida';

  @computed
  Function get loginPressed =>
      emailValid && passwordValid && !loading ? _login : null;

  @action
  Future<void> _login() async {
    loading = true;
    try {
      final user = await UserRepository().loginWithEmail(email, password);
      GetIt.I.get<UserManagerController>().setUser(user);
    } catch (e) {
      error = e;
      print("Exception $e");
    }
    loading = false;
  }
}
