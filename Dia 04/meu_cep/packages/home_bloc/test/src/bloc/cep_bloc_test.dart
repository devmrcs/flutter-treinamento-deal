import 'package:bloc_test/bloc_test.dart';
import 'package:cep_infra/cep_infra.dart';
import 'package:cep_models/cep_models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_bloc/src/bloc/cep_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockCepService extends Mock implements CepService {}

void main() {
  group('CepBloc', () {
    late MockCepService mockCepService;
    final CepModel mockCepModelSuccess = CepModel(cep: '74915120');

    setUp(() {
      mockCepService = MockCepService();
    });

    blocTest<CepBloc, CepState>(
      'emits [] quando o bloc é criado',
      build: () => CepBloc(
        cepService: mockCepService,
      ),
      expect: () => [],
    );

    test('o estado inicial é InitialState', () {
      // arrange
      final bloc = CepBloc(cepService: mockCepService);

      expect(bloc.state, CepInitial());
    });

    blocTest<CepBloc, CepState>(
      'emit [CepLoading, CepSuccess] quando o GetCepEvent é adicionado',
      setUp: () async {
        when(
          () => mockCepService.getCep(any()),
        ).thenAnswer((_) async => mockCepModelSuccess);
      },
      build: () => CepBloc(cepService: mockCepService),
      act: (bloc) => bloc.add(GetCepEvent(cep: '123456789')),
      expect: () => [
        CepLoading(),
        CepSuccess(cepModel: mockCepModelSuccess),
      ],
    );

    test('emit [CepLoading, CepFailure] quando o GetCepEvent é adicionado com um cep inválido', () {
      //arrange
      final CepModel cepModel = CepModel(cep: null);
      when(
        () => mockCepService.getCep(any()),
      ).thenAnswer((_) async => cepModel);
      final bloc = CepBloc(cepService: mockCepService);

      // act
      bloc.add(GetCepEvent(cep: '12345678'));

      // assert
      expectLater(
        bloc.stream,
        emitsInOrder([
          CepLoading(),
          CepFailure(errorMessage: 'CEP não encontrado'),
        ]),
      );
    });
  });
}
