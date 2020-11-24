// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../controllers/user_manager_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserManagerController on _UserManagerControllerBase, Store {
  final _$userAtom = Atom(name: '_UserManagerControllerBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_UserManagerControllerBaseActionController =
      ActionController(name: '_UserManagerControllerBase');

  @override
  void setUser(UserModel user) {
    final _$actionInfo = _$_UserManagerControllerBaseActionController
        .startAction(name: '_UserManagerControllerBase.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_UserManagerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
