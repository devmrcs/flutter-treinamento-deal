part of 'cep_bloc.dart';

@immutable
abstract class CepState {}

class CepInitial extends CepState {}

class CepLoading extends CepState {}

class CepFailure extends CepState {
  final String errorMessage;

  CepFailure({
    required this.errorMessage,
  });
}

class CepSuccess extends CepState {
  final CepModel cepModel;

  CepSuccess({
    required this.cepModel,
  });
}
