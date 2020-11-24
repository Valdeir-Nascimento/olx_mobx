import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olxmobx/controllers/user_manager_controller.dart';
import 'package:olxmobx/helpers/extensions.dart';
import 'package:olxmobx/models/user_model.dart';
import 'package:olxmobx/repositories/user_repository.dart';
part 'signup_controller.g.dart';

class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {
  @observable
  String name;

  @observable
  String email;

  @observable
  String phone;

  @observable
  String pass2;

  @observable
  String pass1;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  void setName(String value) => name = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setPass1(String value) => pass1 = value;

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get nameValid => name != null && name.length > 6;
  String get nameError {
    if (name == null || nameValid)
      return null;
    else if (name.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Nome muito curto';
  }

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError {
    if (email == null || emailValid)
      return null;
    else if (email.isEmpty)
      return 'Campo obrigatório';
    else
      return 'E-mail inválido';
  }

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;
  String get phoneError {
    if (phone == null || phoneValid)
      return null;
    else if (phone.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Celular inválido';
  }

  @computed
  bool get pass1Valid => pass1 != null && pass1.length >= 6;
  String get pass1Error {
    if (pass1 == null || pass1Valid)
      return null;
    else if (pass1.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senha muito curta';
  }

  @computed
  bool get pass2Valid => pass2 != null && pass2 == pass1;
  String get pass2Error {
    if (pass2 == null || pass2Valid)
      return null;
    else
      return 'Senhas não coincidem';
  }

  @computed
  bool get isFormValid =>
      nameValid && emailValid && phoneValid && pass1Valid && pass2Valid;

  @computed
  Function get signUpPressed => (isFormValid && !loading) ? _signUp : null;

  @action
  Future<void> _signUp() async {
    loading = true;

    final user =
        UserModel(nome: name, email: email, telefone: phone, senha: pass1);

    try {
      final resultUser = await UserRepository().signUp(user);
      GetIt.I.get<UserManagerController>().setUser(resultUser);
      //GetIt.I<UserManagerController>().setUser(resultUser);
    } catch (e) {
      error = e;
    }

    loading = false;
  }
}
