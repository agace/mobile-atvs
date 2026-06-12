import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loja/apresentacao/widgets/aviso_vazio.dart';

void main() {
  testWidgets('AvisoVazio renderiza icone, titulo e descricao', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AvisoVazio(
            icone: Icons.shopping_cart_outlined,
            titulo: 'Carrinho vazio',
            descricao: 'Adicione produtos.',
          ),
        ),
      ),
    );

    expect(find.text('Carrinho vazio'), findsOneWidget);
    expect(find.text('Adicione produtos.'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);
  });

  testWidgets('AvisoVazio omite a descricao quando nao informada', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AvisoVazio(icone: Icons.search_off, titulo: 'Sem resultados'),
        ),
      ),
    );

    expect(find.text('Sem resultados'), findsOneWidget);

    expect(find.byType(Text), findsOneWidget);
  });
}
