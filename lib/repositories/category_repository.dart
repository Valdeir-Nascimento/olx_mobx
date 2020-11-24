import 'package:olxmobx/models/category_model.dart';
import 'package:olxmobx/repositories/parse_errors.dart';
import 'package:olxmobx/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CategoryRepository {
  Future<List<CategoryModel>> getCategorias() async {
    final queryBuilder = QueryBuilder(ParseObject(keyCategoryTable))
      ..orderByAscending(keyCategoryDescription);

    final response = await queryBuilder.query();  
    if(response.success) {
      return response.results.map((parse) => CategoryModel.fromParse(parse)).toList();
    } else {
      throw ParseErrors.getDescription(response.error.code);
    }
  }
}
