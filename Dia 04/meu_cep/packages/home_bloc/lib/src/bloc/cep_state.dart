part of 'cep_bloc.dart';

@immutable
abstract class CepState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CepInitial extends CepState {}

class CepLoading extends CepState {}

class CepFailure extends CepState {
  final String errorMessage;

  CepFailure({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}

class CepSuccess extends CepState {
  final CepModel cepModel;

  CepSuccess({
    required this.cepModel,
  });

  @override
  List<Object?> get props => [cepModel];
}
