import 'dart:convert';
import 'dart:io';

import 'package:cep_models/cep_models.dart';
import 'package:hive/hive.dart';

class CepHiveDataSource {
  CepHiveDataSource() {
    Hive.init(Directory.systemTemp.path);
  }

  Future<CepModel> getCep(String cep) async {
    final Box<String> cepBox = await Hive.openBox('cep_box');
    final String? jsonCepModel = cepBox.get(cep);

    if (jsonCepModel == null) {
      throw Exception('📶 CEP não encontrado localmente');
    }

    return CepModel.fromJson(json.decode(jsonCepModel));
  }

  Future<void> saveCep(String cep, CepModel cepModel) async {
    final Box<String> cepBox = await Hive.openBox('cep_box');
    await cepBox.put(cep, json.encode(cepModel.toJson()));
  }
}
