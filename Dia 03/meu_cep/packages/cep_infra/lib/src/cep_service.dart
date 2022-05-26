import 'package:cep_infra/src/datasources/cep_hive_datasource.dart';
import 'package:cep_infra/src/datasources/cep_http_datasource.dart';
import 'package:cep_models/cep_models.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class CepService {
  final CepHttpDataSource _httpDataSource = CepHttpDataSource();
  final CepHiveDataSource _hiveDataSource = CepHiveDataSource();

  Future<CepModel> getCep(String cep) async {
    final bool isConnected = await Connectivity().checkConnectivity() != ConnectivityResult.none;
    if (isConnected) {
      final CepModel cepModel = await _httpDataSource.getCep(cep);
      await _hiveDataSource.saveCep(cep, cepModel);

      return cepModel;
    } else {
      return await _hiveDataSource.getCep(cep);
    }
  }
}
