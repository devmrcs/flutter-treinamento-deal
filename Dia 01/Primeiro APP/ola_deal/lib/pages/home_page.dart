import 'package:flutter/material.dart';
import 'package:ola_deal/pages/widgets/custom_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: CustomButton(
          onPressed: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return const DetailsPage();
            //     },
            //   ),
            // );
            Navigator.of(context).pushNamed('/details');
          },
          texto: 'Navegar para Details',
        ),
      ),
    );
  }
}
