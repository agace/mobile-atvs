import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:loja/apresentacao/provedores/provedores.dart';
import 'package:loja/dados/fontes/banco_local.dart';
import 'package:loja/main.dart';
import 'package:loja/nucleo/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../test/ajudantes/dados_falsos.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('fluxo completo: catalogo -> detalhe -> adicionar ao carrinho', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = Prefs(await SharedPreferences.getInstance());
    final banco = BancoLocal.paraTeste(NativeDatabase.memory());
    addTearDown(banco.close);

    final produtos = [
      produtoFalso(id: 1, titulo: 'Camiseta Flutter', preco: 80),
      produtoFalso(id: 2, titulo: 'Caneca Dart', preco: 40),
    ];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          prefsProvider.overrideWithValue(prefs),
          bancoLocalProvider.overrideWithValue(banco),
          repositorioProdutosProvider.overrideWithValue(
            RepositorioProdutosFalso(produtos),
          ),
        ],
        child: const AppLoja(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Camiseta Flutter'), findsOneWidget);
    expect(find.text('Caneca Dart'), findsOneWidget);

    await tester.ensureVisible(find.text('Camiseta Flutter'));
    await tester.pumpAndSettle();
    await tester.tap(
      find
          .ancestor(
            of: find.text('Camiseta Flutter'),
            matching: find.byType(InkWell),
          )
          .first,
    );
    await tester.pumpAndSettle();
    expect(find.textContaining('Adicionar'), findsOneWidget);

    await tester.tap(find.textContaining('Adicionar'));
    await tester.pumpAndSettle();

    expect(find.text('Camiseta Flutter'), findsOneWidget);
    expect(find.text('Finalizar compra'), findsOneWidget);

    await tester.tap(find.text('Finalizar compra'));
    await tester.pumpAndSettle();
    expect(find.text('Pedido confirmado!'), findsOneWidget);

    await tester.tap(find.text('Continuar comprando'));
    await tester.pumpAndSettle();
    expect(find.text('Camiseta Flutter'), findsOneWidget);
  });
}
