import 'package:cep_utils/cep_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../controllers/home_controller.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeController>(
          create: (_) => HomeController(),
        ),
      ],
      child: _HomeProviderView(),
    );
  }
}

class _HomeProviderView extends StatelessWidget {
  _HomeProviderView({Key? key}) : super(key: key);

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // final controller = context.read<HomeController>();
    final controller = Provider.of<HomeController>(context, listen: false);
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
                      controller.getCep(value);
                    }
                  },
                ),
                const SizedBox(height: 16),
                Consumer<HomeController>(
                  builder: ((context, value, child) {
                    debugPrint('Rebuild Consumer');
                    if (value.isLoading) {
                      return const CircularProgressIndicator();
                    }

                    if (value.errorMessage?.isNotEmpty ?? false) {
                      return Text(value.errorMessage!);
                    }

                    return Text(value.cepModel?.toString() ?? 'Nenhum CEP inserido');
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
