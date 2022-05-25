import 'dart:convert';

import 'package:cep_models/cep_models.dart';
import 'package:http/http.dart' as http;

class CepService {
  Future<CepModel> getCep(String cep) async {
    await Future.delayed(const Duration(seconds: 2));
    final Uri uri = Uri.parse('https://viacep.com.br/ws/$cep/json/');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final CepModel cepModel = CepModel.fromJson(
        json.decode(response.body),
      );

      return cepModel;
    } else {
      throw Exception('Falha ao buscar CEP');
    }
  }
}
