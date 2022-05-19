import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String texto;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(primary: Colors.green),
      child: Text(texto),
    );
  }
}
