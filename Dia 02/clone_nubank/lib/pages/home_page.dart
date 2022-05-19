import 'package:clone_nubank/nu_ds_icons.dart';
import 'package:clone_nubank/pages/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/conta_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarNuBank(),
          const Conta(),
          SizedBox(
            height: 150,
            child: ListView(
              padding: const EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              children: const [
                ItemCircleMenu(
                  icon: NuDSIcons.pix,
                  label: 'Área Pix',
                ),
                SizedBox(width: 16),
                ItemCircleMenu(
                  icon: NuDSIcons.bar_code,
                  label: 'Pagar',
                ),
                SizedBox(width: 16),
                ItemCircleMenu(
                  icon: NuDSIcons.money_up,
                  label: 'Transferir',
                ),
                SizedBox(width: 16),
                ItemCircleMenu(
                  icon: NuDSIcons.money_down,
                  label: 'Depositar',
                ),
                SizedBox(width: 16),
                ItemCircleMenu(
                  icon: NuDSIcons.smartphone,
                  label: 'Recarga de celular',
                ),
                SizedBox(width: 16),
                ItemCircleMenu(
                  icon: NuDSIcons.pix,
                  label: 'Área Pix',
                ),
                SizedBox(width: 16),
                ItemCircleMenu(
                  icon: NuDSIcons.bar_code,
                  label: 'Pagar',
                ),
                SizedBox(width: 16),
                ItemCircleMenu(
                  icon: NuDSIcons.money_up,
                  label: 'Transferir',
                ),
                SizedBox(width: 16),
                ItemCircleMenu(
                  icon: NuDSIcons.money_down,
                  label: 'Depositar',
                ),
                SizedBox(width: 16),
                ItemCircleMenu(
                  icon: NuDSIcons.smartphone,
                  label: 'Recarga de celular',
                ),
                SizedBox(width: 16),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemCircleMenu extends StatelessWidget {
  const ItemCircleMenu({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint(label);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.05),
            ),
            height: 70,
            width: 70,
            child: Icon(icon),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 70,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
