import 'package:cep_infra/src/datasources/cep_hive_datasource.dart';
import 'package:cep_infra/src/datasources/cep_http_datasource.dart';
import 'package:cep_models/cep_models.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class CepService {
  final CepHttpDataSource _httpDataSource;
  final CepHiveDataSource _hiveDataSource;
  final Connectivity? _connectivity;

  const CepService({
    CepHttpDataSource httpDataSource = const CepHttpDataSource(),
    CepHiveDataSource hiveDataSource = const CepHiveDataSource(),
    Connectivity? connectivity,
  })  : _httpDataSource = httpDataSource,
        _hiveDataSource = hiveDataSource,
        _connectivity = connectivity;

  Future<CepModel> getCep(String cep) async {
    final ConnectivityResult result = await (_connectivity ?? Connectivity()).checkConnectivity();
    final bool isConnected = result != ConnectivityResult.none;
    if (isConnected) {
      final CepModel cepModel = await _httpDataSource.getCep(cep);
      await _hiveDataSource.saveCep(cep, cepModel);

      return cepModel;
    } else {
      return await _hiveDataSource.getCep(cep);
    }
  }
}
