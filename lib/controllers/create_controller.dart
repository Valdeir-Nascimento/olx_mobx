import 'package:mobx/mobx.dart';

import '../models/category_model.dart';
import '../models/category_model.dart';
part 'create_controller.g.dart';

class CreateController = _CreateControllerBase with _$CreateController;

abstract class _CreateControllerBase with Store {
  ObservableList images = ObservableList();

  @observable
  CategoryModel category;

  @action
  void setCategory(CategoryModel value) => category = value;
}
