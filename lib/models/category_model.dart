
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'package:olxmobx/repositories/table_keys.dart';

class CategoryModel {
  String id;
  String description;

  CategoryModel({
    this.id,
    this.description,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return CategoryModel(
      id: map['id'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
    };
  }

  CategoryModel.fromParse(ParseObject parseObject) : 
    id = parseObject.objectId,
    description = parseObject.get(keyCategoryDescription);
  

  @override
  String toString() => 'CategoryModel(id: $id, description: $description)';
}
