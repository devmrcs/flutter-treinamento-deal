import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Build...');

    return Scaffold(
      appBar: AppBar(
        title: Text(_counter.toString()),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _incrementCounter();
            // Navigator.of(context).pop();
          },
          child: const Text('Incrementar contador'),
        ),
      ),
    );
  }
}
