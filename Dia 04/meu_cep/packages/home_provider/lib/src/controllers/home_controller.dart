import 'package:cep_infra/cep_infra.dart';
import 'package:cep_models/cep_models.dart';
import 'package:flutter/widgets.dart';

class HomeController extends ChangeNotifier {
  final CepService _cepService = const CepService();

  CepModel? _cepModel;
  CepModel? get cepModel => _cepModel;

  String _errorMessage = '';
  String? get errorMessage => _errorMessage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getCep(String cep) async {
    try {
      _isLoading = true;
      notifyListeners();
      _cepModel = await _cepService.getCep(cep);

      if (_cepModel!.cep == null) {
        _errorMessage = 'CEP não encontrado';
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
    }
    notifyListeners();
  }
}
