import 'dart:io';

void main() {
  print('Entre com seu nome');
  final String? nome = stdin.readLineSync();
  print('Olá $nome, seja bem vindo(a)!');
}
