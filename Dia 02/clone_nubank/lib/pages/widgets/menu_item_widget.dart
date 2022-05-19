import 'package:clone_nubank/nu_ds_icons.dart';
import 'package:clone_nubank/pages/widgets/circle_item_menu_widget.dart';
import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  MenuItems({
    Key? key,
  }) : super(key: key);

  final Map<String, IconData> items = <String, IconData>{
    'Área Pix': NuDSIcons.pix,
    'Pagar': NuDSIcons.bar_code,
    'Transferir': NuDSIcons.money_up,
    'Depositar': NuDSIcons.money_down,
    'Área Pix2': NuDSIcons.pix,
    'Pagar2': NuDSIcons.bar_code,
    'Transferir2': NuDSIcons.money_up,
    'Depositar2': NuDSIcons.money_down,
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final key = items.keys.elementAt(index);
          final icon = items[key]!;

          return ItemCircleMenu(
            icon: icon,
            label: key,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16);
        },
      ),
    );
  }
}
