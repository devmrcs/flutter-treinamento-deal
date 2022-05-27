// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:cep_infra/cep_infra.dart';
import 'package:cep_models/cep_models.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cep_event.dart';
part 'cep_state.dart';

class CepBloc extends Bloc<CepEvent, CepState> {
  final CepService _cepService;

  CepBloc({
    CepService cepService = const CepService(),
  })  : _cepService = cepService,
        super(CepInitial()) {
    on<GetCepEvent>((event, emit) async {
      try {
        emit(CepLoading());
        final CepModel cepModel = await _cepService.getCep(event.cep);

        if (cepModel.cep == null) {
          emit(CepFailure(errorMessage: 'CEP não encontrado'));
          return;
        }

        emit(CepSuccess(cepModel: cepModel));
      } catch (e) {
        emit(CepFailure(errorMessage: e.toString()));
      }
    });
  }
}
