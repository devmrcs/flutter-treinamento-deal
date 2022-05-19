void main() {
  // customPrint();
  // int resultado = funcaoComParametroPosicional(10);
  // int resultado = funcaoComParametroNomeado(valor2: 12);
  // print(resultado);
  funcaoAsync();
  funcaoComParametroNomeado(valor2: 1);
}

customPrint() {
  print('Olá mundo!');
}

int funcaoComParametroPosicional(int valor1) {
  return valor1 + 1;
}

int funcaoComParametroNomeado({required int valor2}) {
  return valor2;
}

int funcaoComParametroNomeadoOpcional({int? valor2}) {
  return valor2 ?? 0;
}

Future funcaoAsync() async {
  print('A');

  await Future.delayed(
    Duration(seconds: 2),
    () {
      print('B');
    },
  );

  print('C');
}
