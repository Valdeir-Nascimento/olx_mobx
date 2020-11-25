// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryController on _CategoryControllerBase, Store {
  Computed<List<CategoryModel>> _$allCategoryListComputed;

  @override
  List<CategoryModel> get allCategoryList => (_$allCategoryListComputed ??=
          Computed<List<CategoryModel>>(() => super.allCategoryList,
              name: '_CategoryControllerBase.allCategoryList'))
      .value;

  final _$errorAtom = Atom(name: '_CategoryControllerBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_CategoryControllerBaseActionController =
      ActionController(name: '_CategoryControllerBase');

  @override
  void setCategorias(List<CategoryModel> categorias) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.setCategorias');
    try {
      return super.setCategorias(categorias);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String value) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
allCategoryList: ${allCategoryList}
    ''';
  }
}
