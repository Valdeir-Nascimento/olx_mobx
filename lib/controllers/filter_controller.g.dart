// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterController on _FilterControllerBase, Store {
  Computed<String> _$priceErrorComputed;

  @override
  String get priceError =>
      (_$priceErrorComputed ??= Computed<String>(() => super.priceError,
              name: '_FilterControllerBase.priceError'))
          .value;

  final _$orderByAtom = Atom(name: '_FilterControllerBase.orderBy');

  @override
  OrderByEnum get orderBy {
    _$orderByAtom.reportRead();
    return super.orderBy;
  }

  @override
  set orderBy(OrderByEnum value) {
    _$orderByAtom.reportWrite(value, super.orderBy, () {
      super.orderBy = value;
    });
  }

  final _$minPriceAtom = Atom(name: '_FilterControllerBase.minPrice');

  @override
  int get minPrice {
    _$minPriceAtom.reportRead();
    return super.minPrice;
  }

  @override
  set minPrice(int value) {
    _$minPriceAtom.reportWrite(value, super.minPrice, () {
      super.minPrice = value;
    });
  }

  final _$maxPriceAtom = Atom(name: '_FilterControllerBase.maxPrice');

  @override
  int get maxPrice {
    _$maxPriceAtom.reportRead();
    return super.maxPrice;
  }

  @override
  set maxPrice(int value) {
    _$maxPriceAtom.reportWrite(value, super.maxPrice, () {
      super.maxPrice = value;
    });
  }

  final _$_FilterControllerBaseActionController =
      ActionController(name: '_FilterControllerBase');

  @override
  dynamic setOrderBy(OrderByEnum orderByEnum) {
    final _$actionInfo = _$_FilterControllerBaseActionController.startAction(
        name: '_FilterControllerBase.setOrderBy');
    try {
      return super.setOrderBy(orderByEnum);
    } finally {
      _$_FilterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMinPrice(int value) {
    final _$actionInfo = _$_FilterControllerBaseActionController.startAction(
        name: '_FilterControllerBase.setMinPrice');
    try {
      return super.setMinPrice(value);
    } finally {
      _$_FilterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setMaxPrice(int value) {
    final _$actionInfo = _$_FilterControllerBaseActionController.startAction(
        name: '_FilterControllerBase.setMaxPrice');
    try {
      return super.setMaxPrice(value);
    } finally {
      _$_FilterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
orderBy: ${orderBy},
minPrice: ${minPrice},
maxPrice: ${maxPrice},
priceError: ${priceError}
    ''';
  }
}
