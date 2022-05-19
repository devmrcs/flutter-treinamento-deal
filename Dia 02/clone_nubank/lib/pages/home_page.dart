import 'package:clone_nubank/pages/widgets/app_bar_widget.dart';
import 'package:clone_nubank/pages/widgets/menu_item_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/conta_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              const AppBarNuBank(),
              const Conta(),
              MenuItems(),
            ],
          ),
        ),
      ),
    );
  }
}
