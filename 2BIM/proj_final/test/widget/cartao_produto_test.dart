import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loja/apresentacao/widgets/cartao_produto.dart';

import '../ajudantes/dados_falsos.dart';

Widget _envolver(Widget filho) {
  return MaterialApp(home: Scaffold(body: filho));
}

void main() {
  group('CartaoProduto', () {
    testWidgets('exibe titulo e preco com desconto aplicado', (tester) async {
      await tester.pumpWidget(
        _envolver(
          CartaoProduto(
            produto: produtoFalso(
              titulo: 'Fone Bluetooth',
              preco: 100,
              percentualDesconto: 20,
            ),
            aoTocar: () {},
          ),
        ),
      );

      expect(find.text('Fone Bluetooth'), findsOneWidget);

      expect(find.textContaining('80,00'), findsOneWidget);
    });

    testWidgets('mostra o selo de desconto quando ha desconto', (tester) async {
      await tester.pumpWidget(
        _envolver(
          CartaoProduto(
            produto: produtoFalso(percentualDesconto: 15),
            aoTocar: () {},
          ),
        ),
      );

      expect(find.text('-15%'), findsOneWidget);
    });

    testWidgets('oculta o selo de desconto quando nao ha desconto', (
      tester,
    ) async {
      await tester.pumpWidget(
        _envolver(
          CartaoProduto(
            produto: produtoFalso(percentualDesconto: 0),
            aoTocar: () {},
          ),
        ),
      );

      expect(find.textContaining('%'), findsNothing);
    });

    testWidgets('dispara o callback ao tocar', (tester) async {
      var tocou = false;
      await tester.pumpWidget(
        _envolver(
          CartaoProduto(
            produto: produtoFalso(titulo: 'Item X'),
            aoTocar: () => tocou = true,
          ),
        ),
      );

      await tester.tap(
        find.ancestor(of: find.text('Item X'), matching: find.byType(InkWell)),
      );
      expect(tocou, isTrue);
    });
  });
}
