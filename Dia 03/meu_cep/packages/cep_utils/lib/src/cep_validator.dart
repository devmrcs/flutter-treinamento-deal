class CepValidator {
  static String? validateCep(String? cep) {
    if (cep == null || cep.isEmpty) {
      return 'Insira o CEP';
    }

    // 74915120
    if (cep.length != 8) {
      return 'CEP Inválido';
    }

    return null;
  }
}
