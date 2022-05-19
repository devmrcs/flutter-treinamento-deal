void main() {
  // Gato gato = Gato('Miau');
  // Gato gato = Gato.nomeado('Miau2');
  _Gato gato = _Gato.adotar('Ralph');

  // print(gato.nome);
  gato.comer();

  Passaro passaro = Passaro();
  passaro.voar();
  passaro.nadar();
}

abstract class Animal {
  void comer() {
    print('🥙 Comendo...');
  }
}

abstract class Voar {
  void voar() {
    print('🦆 Voando...');
  }
}

abstract class Nadar {
  void nadar() {
    print('🐠 Nadando...');
  }
}

class _Gato extends Animal {
  final String nome;

  final String _variavelPrivada = 'Variavel Privada';

  _Gato(this.nome);
  _Gato.nomeado(this.nome);

  factory _Gato.adotar(String nome) {
    print('Estou adotando');

    return _Gato(nome);
  }

  void _metodoPrivado() {
    print('Metodo Privado');
  }
}

class Passaro extends Animal with Voar, Nadar {}
