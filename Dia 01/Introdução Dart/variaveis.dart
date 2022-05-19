// ignore_for_file: unused_local_variable

void main() {
  // var nome = 'João';
  // String sobrenome = "Silva";
  // final String nomeCompleto = "$nome $sobrenome";
  // print(nomeCompleto);
  // print('Nome Completo: $nome $sobrenome');
  // const String nomeConstante = "nome Constante";

  // String? nomePaiPodeSerNulo;
  // print(nomePaiPodeSerNulo);
  // nomePaiPodeSerNulo = 'Marcos';
  // print(nomePaiPodeSerNulo);

  final Map<String, dynamic> json = {
    'temperatura': 20.0,
  };

  String varString = 'Olá Deal';
  num varNum = 1.0;
  int varInt = 1;
  double varDouble = 1.0;
  bool varBool = false;
  List varList = [1, 2, 3];
  // // varList.add('asdasd');

  // Map<String, String> varMap = {};
  // print(varMap);
  // varMap['chave'] = 'Valor';
  // varMap.putIfAbsent('chave2', () => 'Valor2');
  // print(varMap);

  // print(varMap['chave']);

  // Function varFunction = customPrint;
  // varFunction();
  var varDynamic;
  varDynamic = 1;
  print(varDynamic.runtimeType);
  varDynamic = 'String';
  print(varDynamic.runtimeType);
}

void customPrint() {
  print('Olá mundo!');
}
