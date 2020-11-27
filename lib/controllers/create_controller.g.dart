// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateController on _CreateControllerBase, Store {
  Computed<bool> _$imagesValidComputed;

  @override
  bool get imagesValid =>
      (_$imagesValidComputed ??= Computed<bool>(() => super.imagesValid,
              name: '_CreateControllerBase.imagesValid'))
          .value;
  Computed<bool> _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: '_CreateControllerBase.titleValid'))
          .value;
  Computed<bool> _$descricaoValidComputed;

  @override
  bool get descricaoValid =>
      (_$descricaoValidComputed ??= Computed<bool>(() => super.descricaoValid,
              name: '_CreateControllerBase.descricaoValid'))
          .value;
  Computed<bool> _$categoryValidComputed;

  @override
  bool get categoryValid =>
      (_$categoryValidComputed ??= Computed<bool>(() => super.categoryValid,
              name: '_CreateControllerBase.categoryValid'))
          .value;
  Computed<EnderecoModel> _$enderecoComputed;

  @override
  EnderecoModel get endereco =>
      (_$enderecoComputed ??= Computed<EnderecoModel>(() => super.endereco,
              name: '_CreateControllerBase.endereco'))
          .value;
  Computed<num> _$precoComputed;

  @override
  num get preco => (_$precoComputed ??=
          Computed<num>(() => super.preco, name: '_CreateControllerBase.preco'))
      .value;
  Computed<bool> _$precoValidComputed;

  @override
  bool get precoValid =>
      (_$precoValidComputed ??= Computed<bool>(() => super.precoValid,
              name: '_CreateControllerBase.precoValid'))
          .value;
  Computed<bool> _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_CreateControllerBase.formValid'))
          .value;
  Computed<Function> _$sendPressedComputed;

  @override
  Function get sendPressed =>
      (_$sendPressedComputed ??= Computed<Function>(() => super.sendPressed,
              name: '_CreateControllerBase.sendPressed'))
          .value;

  final _$categoryAtom = Atom(name: '_CreateControllerBase.category');

  @override
  CategoryModel get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(CategoryModel value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$hidePhoneAtom = Atom(name: '_CreateControllerBase.hidePhone');

  @override
  bool get hidePhone {
    _$hidePhoneAtom.reportRead();
    return super.hidePhone;
  }

  @override
  set hidePhone(bool value) {
    _$hidePhoneAtom.reportWrite(value, super.hidePhone, () {
      super.hidePhone = value;
    });
  }

  final _$showErrosAtom = Atom(name: '_CreateControllerBase.showErros');

  @override
  bool get showErros {
    _$showErrosAtom.reportRead();
    return super.showErros;
  }

  @override
  set showErros(bool value) {
    _$showErrosAtom.reportWrite(value, super.showErros, () {
      super.showErros = value;
    });
  }

  final _$titleAtom = Atom(name: '_CreateControllerBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_CreateControllerBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$precoTextAtom = Atom(name: '_CreateControllerBase.precoText');

  @override
  String get precoText {
    _$precoTextAtom.reportRead();
    return super.precoText;
  }

  @override
  set precoText(String value) {
    _$precoTextAtom.reportWrite(value, super.precoText, () {
      super.precoText = value;
    });
  }

  final _$_CreateControllerBaseActionController =
      ActionController(name: '_CreateControllerBase');

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescricao(String value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setDescricao');
    try {
      return super.setDescricao(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(CategoryModel value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHidePhone(bool value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setHidePhone');
    try {
      return super.setHidePhone(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPreco(String value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setPreco');
    try {
      return super.setPreco(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
category: ${category},
hidePhone: ${hidePhone},
showErros: ${showErros},
title: ${title},
description: ${description},
precoText: ${precoText},
imagesValid: ${imagesValid},
titleValid: ${titleValid},
descricaoValid: ${descricaoValid},
categoryValid: ${categoryValid},
endereco: ${endereco},
preco: ${preco},
precoValid: ${precoValid},
formValid: ${formValid},
sendPressed: ${sendPressed}
    ''';
  }
}
