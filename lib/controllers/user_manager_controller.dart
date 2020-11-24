import 'package:mobx/mobx.dart';
import 'package:olxmobx/models/user_model.dart';
import 'package:olxmobx/repositories/user_repository.dart';
part '../repositories/user_manager_controller.g.dart';

class UserManagerController = _UserManagerControllerBase with _$UserManagerController;

abstract class _UserManagerControllerBase with Store {

  _UserManagerControllerBase() {
    _getCurrentUser();
  }

  @observable
  UserModel user;

  @action
  void setUser(UserModel user) => this.user = user;

  @computed
  bool get isLoggedIn => user != null;

  Future<void> _getCurrentUser() async {
    final user = await UserRepository().currentUser();
    setUser(user);
  }


}
