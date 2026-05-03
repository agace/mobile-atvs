import 'package:flutter_test/flutter_test.dart';
import 'package:calculadora/main.dart';

void main() {
  testWidgets('Calculadora renderiza corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculadoraApp());
    expect(find.text('0'), findsOneWidget);
    expect(find.text('Calculadora'), findsOneWidget);
  });
}
