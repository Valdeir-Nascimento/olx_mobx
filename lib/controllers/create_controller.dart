import 'package:mobx/mobx.dart';
part 'create_controller.g.dart';

class CreateController = _CreateControllerBase with _$CreateController;

abstract class _CreateControllerBase with Store {
  
  ObservableList images = ObservableList();
  


}
