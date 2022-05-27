// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<String>? _$computedExampleComputed;

  @override
  String get computedExample => (_$computedExampleComputed ??= Computed<String>(
          () => super.computedExample,
          name: '_HomeStoreBase.computedExample'))
      .value;

  late final _$_cepModelAtom =
      Atom(name: '_HomeStoreBase._cepModel', context: context);

  @override
  CepModel? get _cepModel {
    _$_cepModelAtom.reportRead();
    return super._cepModel;
  }

  @override
  set _cepModel(CepModel? value) {
    _$_cepModelAtom.reportWrite(value, super._cepModel, () {
      super._cepModel = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: '_HomeStoreBase._errorMessage', context: context);

  @override
  String get _errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  set _errorMessage(String value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: '_HomeStoreBase._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$getCepAsyncAction =
      AsyncAction('_HomeStoreBase.getCep', context: context);

  @override
  Future<void> getCep(String cep) {
    return _$getCepAsyncAction.run(() => super.getCep(cep));
  }

  @override
  String toString() {
    return '''
computedExample: ${computedExample}
    ''';
  }
}
