import 'package:mobx/mobx.dart';
import 'package:olxmobx/models/category_model.dart';
import 'package:olxmobx/repositories/category_repository.dart';
part 'category_controller.g.dart';

class CategoryController = _CategoryControllerBase with _$CategoryController;

abstract class _CategoryControllerBase with Store {
  _CategoryControllerBase() {
    _loadCategories();
  }

  @observable
  String error;

  ObservableList<CategoryModel> categoryList =  ObservableList<CategoryModel>();

  @action
  void setCategorias(List<CategoryModel> categorias) {
    //Limpando as categorias p/ não ocorrer categorias duplicadas
    categoryList.clear();
    categoryList.addAll(categorias);
  }

  @action
  void setError(String value) => error = value;

  Future<void> _loadCategories() async {
    try{
      final categorias = await CategoryRepository().getCategorias();
      setCategorias(categorias);
    } catch (e) {
      setError(e);
    }
  }

  @computed
  List<CategoryModel> get allCategoryList => 
  List.from(categoryList)..insert(0, CategoryModel(id: '*', description: 'Todas'));


}
