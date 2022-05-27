import 'package:cep_infra/cep_infra.dart';
import 'package:cep_models/cep_models.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final CepService _cepService = const CepService();

  @observable
  CepModel? _cepModel;
  CepModel? get cepModel => _cepModel;

  @observable
  String _errorMessage = '';
  String? get errorMessage => _errorMessage;

  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @computed
  String get computedExample => '${_cepModel?.cep} + $_isLoading';

  @action
  Future<void> getCep(String cep) async {
    try {
      _isLoading = true;
      _cepModel = await _cepService.getCep(cep);

      if (_cepModel!.cep == null) {
        _errorMessage = 'CEP não encontrado';
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
    }
  }
}
