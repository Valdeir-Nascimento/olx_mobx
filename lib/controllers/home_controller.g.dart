// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$searchAtom = Atom(name: '_HomeControllerBase.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$categorySelectedAtom =
      Atom(name: '_HomeControllerBase.categorySelected');

  @override
  CategoryModel get categorySelected {
    _$categorySelectedAtom.reportRead();
    return super.categorySelected;
  }

  @override
  set categorySelected(CategoryModel value) {
    _$categorySelectedAtom.reportWrite(value, super.categorySelected, () {
      super.categorySelected = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategoy(CategoryModel category) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setCategoy');
    try {
      return super.setCategoy(category);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
categorySelected: ${categorySelected}
    ''';
  }
}
