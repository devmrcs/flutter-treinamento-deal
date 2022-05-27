import 'package:cep_utils/cep_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controllers/home_store.dart';

class HomeMobx extends StatelessWidget {
  HomeMobx({Key? key}) : super(key: key);

  final FocusNode _focusNode = FocusNode();
  final HomeStore homeStore = HomeStore();

  @override
  Widget build(BuildContext context) {
    debugPrint('❤ Build Widget Pai');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Insira seu CEP'),
      ),
      body: GestureDetector(
        onTap: () {
          _focusNode.unfocus();
        },
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  focusNode: _focusNode,
                  decoration: const InputDecoration(labelText: 'CEP'),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: CepValidator.validateCep,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    if (value.length == 8) {
                      homeStore.getCep(value);
                    }
                  },
                ),
                const SizedBox(height: 16),
                Observer(
                  builder: ((context) {
                    debugPrint('Rebuild Consumer');
                    if (homeStore.isLoading) {
                      return const CircularProgressIndicator();
                    }

                    if (homeStore.errorMessage?.isNotEmpty ?? false) {
                      return Text(homeStore.errorMessage!);
                    }

                    return Text(homeStore.cepModel?.toString() ?? 'Nenhum CEP inserido');
                  }),
                ),
                Observer(
                  builder: (_) {
                    return Text(homeStore.computedExample);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
