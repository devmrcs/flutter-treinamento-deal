import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:meu_cep/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets(
      'Usuario inserindo um CEP válido',
      (WidgetTester tester) async {
        const String mockInitialText = 'Nenhum CEP inserido';
        const String mockValidCep = '74915120';
        const String mockResultCep = 'CEP: 74915-120, Logradouro: Rua Igaçaba';
        const Duration mockDurationServerResponse = Duration(seconds: 3);

        app.main();
        await tester.pumpAndSettle();

        expect(find.text(mockInitialText), findsOneWidget);

        await tester.enterText(find.byKey(const ValueKey('input_cep')), mockValidCep);

        await tester.pump();
        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        await tester.pumpAndSettle(mockDurationServerResponse);
        expect(find.text(mockResultCep), findsOneWidget);
      },
    );
  });
}
