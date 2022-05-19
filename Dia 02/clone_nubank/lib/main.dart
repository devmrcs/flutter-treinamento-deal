import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clone NuBank',
      theme: ThemeData(
        primaryColor: const Color(0xFF830AD1),
        fontFamily: 'Graphik',
      ),
      home: const HomePage(),
    );
  }
}
