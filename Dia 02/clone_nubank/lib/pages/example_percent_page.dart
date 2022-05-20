import 'package:flutter/material.dart';

class ExamplePercentPage extends StatelessWidget {
  const ExamplePercentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final block = screenWidth / 411.42857142857144;

    return Scaffold(
      body: Center(
        child: Container(
          height: 100 * block,
          width: 100 * block,
          color: Colors.green,
        ),
      ),
    );
  }
}
