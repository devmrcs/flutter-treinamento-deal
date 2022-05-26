part of 'cep_bloc.dart';

@immutable
abstract class CepEvent {}

class GetCepEvent extends CepEvent {
  final String cep;

  GetCepEvent({
    required this.cep,
  });
}
