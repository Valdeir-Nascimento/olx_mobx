// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CepController on _CepControllerBase, Store {
  Computed<String> _$clearCepComputed;

  @override
  String get clearCep =>
      (_$clearCepComputed ??= Computed<String>(() => super.clearCep,
              name: '_CepControllerBase.clearCep'))
          .value;

  final _$cepAtom = Atom(name: '_CepControllerBase.cep');

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  final _$enderecoAtom = Atom(name: '_CepControllerBase.endereco');

  @override
  EnderecoModel get endereco {
    _$enderecoAtom.reportRead();
    return super.endereco;
  }

  @override
  set endereco(EnderecoModel value) {
    _$enderecoAtom.reportWrite(value, super.endereco, () {
      super.endereco = value;
    });
  }

  final _$errorAtom = Atom(name: '_CepControllerBase.error');

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

  final _$loadingAtom = Atom(name: '_CepControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_buscarCepAsyncAction = AsyncAction('_CepControllerBase._buscarCep');

  @override
  Future<void> _buscarCep() {
    return _$_buscarCepAsyncAction.run(() => super._buscarCep());
  }

  final _$_CepControllerBaseActionController =
      ActionController(name: '_CepControllerBase');

  @override
  void setCep(String value) {
    final _$actionInfo = _$_CepControllerBaseActionController.startAction(
        name: '_CepControllerBase.setCep');
    try {
      return super.setCep(value);
    } finally {
      _$_CepControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _reset() {
    final _$actionInfo = _$_CepControllerBaseActionController.startAction(
        name: '_CepControllerBase._reset');
    try {
      return super._reset();
    } finally {
      _$_CepControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cep: ${cep},
endereco: ${endereco},
error: ${error},
loading: ${loading},
clearCep: ${clearCep}
    ''';
  }
}
