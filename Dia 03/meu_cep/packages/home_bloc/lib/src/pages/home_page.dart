import 'package:cep_models/cep_models.dart';
import 'package:cep_utils/cep_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_bloc/src/bloc/cep_bloc.dart';

class HomeBloc extends StatelessWidget {
  const HomeBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CepBloc(),
      child: _HomeProviderView(),
    );
  }
}

class _HomeProviderView extends StatelessWidget {
  _HomeProviderView({Key? key}) : super(key: key);

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CepBloc>();
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
                      bloc.add(GetCepEvent(cep: value));
                    }
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<CepBloc, CepState>(
                  builder: ((context, state) {
                    debugPrint('Rebuild BlocBuilder');
                    if (state is CepInitial) {
                      return const Text('Nenhum CEP inserido');
                    }
                    if (state is CepLoading) {
                      return const CircularProgressIndicator();
                    }
                    if (state is CepFailure) {
                      return Text(state.errorMessage);
                    }
                    final CepModel cepModel = (state as CepSuccess).cepModel;
                    return Text(cepModel.toString());
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
