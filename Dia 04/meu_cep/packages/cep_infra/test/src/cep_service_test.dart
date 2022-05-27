// ignore_for_file: prefer_function_declarations_over_variables

import 'package:cep_infra/cep_infra.dart';
import 'package:cep_infra/src/datasources/cep_hive_datasource.dart';
import 'package:cep_infra/src/datasources/cep_http_datasource.dart';
import 'package:cep_models/cep_models.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cep_service_test.mocks.dart';

@GenerateMocks([
  CepHttpDataSource,
  CepHiveDataSource,
  Connectivity,
])
void main() {
  late CepService cepService;
  late CepHttpDataSource mockCepHttpDataSource;
  late CepHiveDataSource mockCepHiveDataSource;
  late Connectivity mockConnectivity;

  setUp(() {
    mockCepHttpDataSource = MockCepHttpDataSource();
    mockCepHiveDataSource = MockCepHiveDataSource();
    mockConnectivity = MockConnectivity();
    cepService = CepService(
      httpDataSource: mockCepHttpDataSource,
      hiveDataSource: mockCepHiveDataSource,
      connectivity: mockConnectivity,
    );
  });

  group('CepService', () {
    test(
      'retorna um CepModel quando é chamado com um cep válido e o dispositivo esta conectado à internet',
      () async {
        // arrange
        final CepModel mockCepModel = CepModel();
        when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => ConnectivityResult.wifi);
        when(mockCepHttpDataSource.getCep('12345678')).thenAnswer((_) async => mockCepModel);
        when(mockCepHiveDataSource.saveCep('12345678', mockCepModel)).thenAnswer((_) async => mockCepModel);

        // act
        final result = await cepService.getCep('12345678');
        // assert
        expect(mockCepModel, result);
      },
    );

    test(
      'retorna um CepModel quando é chamado com um cep válido e o dispositivo não esta conectado à internet',
      () async {
        // arrange
        final CepModel mockCepModel = CepModel();
        when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => ConnectivityResult.none);
        when(mockCepHiveDataSource.getCep('12345678')).thenAnswer((_) async => mockCepModel);

        // act
        final result = await cepService.getCep('12345678');
        // assert
        expect(mockCepModel, result);
      },
    );

    test(
      'retorna uma Exception quando é chamado com um cep inválido e o dispositivo esta conectado à internet',
      () async {
        // arrange
        final Exception mockException = Exception('Falha ao buscar CEP');
        when(mockConnectivity.checkConnectivity()).thenAnswer((_) async => ConnectivityResult.wifi);
        when(mockCepHttpDataSource.getCep('12345678')).thenThrow(mockException);

        // act
        final Function call = () => cepService.getCep('12345678');

        // assert
        expect(call, throwsException);
        expect(call, throwsA(mockException));
        expect(
          call,
          throwsA(
            isInstanceOf<Exception>().having(
              (error) => error.toString(),
              'message',
              mockException.toString(),
            ),
          ),
        );
      },
    );
  });
}
