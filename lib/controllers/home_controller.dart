import 'package:mobx/mobx.dart';
import 'package:olxmobx/models/category_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  @observable
  String search = '';

  @observable
  CategoryModel categorySelected;

  @action
  void setSearch(String value) => search = value;

  @action
  void setCategoy(CategoryModel category) => categorySelected = category;

  

}
