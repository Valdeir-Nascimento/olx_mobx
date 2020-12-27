import 'package:mobx/mobx.dart';
import 'package:olxmobx/enums/orderby_enum.dart';
part 'filter_controller.g.dart';

class FilterController = _FilterControllerBase with _$FilterController;

abstract class _FilterControllerBase with Store {

  @observable
  OrderByEnum orderBy = OrderByEnum.DATA;
  
  @observable
  int minPrice;

  @observable
  int maxPrice;
  
  @action
  setOrderBy(OrderByEnum orderByEnum) => orderBy = orderByEnum;

  @action
  setMinPrice(int value) => minPrice = value;
  
  @action
  setMaxPrice(int value) => maxPrice = value;

  @computed
  String get priceError => maxPrice != null && minPrice != null && maxPrice < minPrice ? "Faixa de preço inválida" : null;


}
