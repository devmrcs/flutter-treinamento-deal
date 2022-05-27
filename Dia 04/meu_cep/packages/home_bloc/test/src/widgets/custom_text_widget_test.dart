import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_bloc/src/widgets/custom_text_widget.dart';

Widget makeTestable(Widget widget) => MaterialApp(home: widget);
void main() {
  testWidgets('CustomText renderizado com sucesso', (WidgetTester tester) async {
    // arrange
    const String mockText = 'MockText';

    // act
    await tester.pumpWidget(makeTestable(const CustomText(text: mockText)));

    // assert
    expect(find.text(mockText), findsOneWidget);
  });
}
