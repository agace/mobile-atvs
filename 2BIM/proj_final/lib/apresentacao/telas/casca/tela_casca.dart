import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../dominio/regras/regras_carrinho.dart';
import '../../../nucleo/i18n/textos.dart';
import '../../provedores/provedores.dart';
import '../carrinho/tela_carrinho.dart';
import '../catalogo/tela_catalogo.dart';
import '../configuracoes/tela_configuracoes.dart';
import '../favoritos/tela_favoritos.dart';

class TelaCasca extends ConsumerWidget {
  const TelaCasca({super.key});

  static const _telas = [
    TelaCatalogo(),
    TelaCarrinho(),
    TelaFavoritos(),
    TelaConfiguracoes(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Textos.of(context);
    final indice = ref.watch(abaProvider);
    final itens = ref.watch(itensCarrinhoProvider).valueOrNull ?? const [];
    final qtdCarrinho = RegrasCarrinho.quantidadeTotal(itens);

    return Scaffold(
      body: IndexedStack(index: indice, children: _telas),
      bottomNavigationBar: NavigationBar(
        selectedIndex: indice,
        onDestinationSelected: (i) => ref.read(abaProvider.notifier).state = i,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.storefront_outlined),
            selectedIcon: const Icon(Icons.storefront_rounded),
            label: t.abaCatalogo,
          ),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: qtdCarrinho > 0,
              label: Text('$qtdCarrinho'),
              child: const Icon(Icons.shopping_bag_outlined),
            ),
            selectedIcon: Badge(
              isLabelVisible: qtdCarrinho > 0,
              label: Text('$qtdCarrinho'),
              child: const Icon(Icons.shopping_bag_rounded),
            ),
            label: t.abaCarrinho,
          ),
          NavigationDestination(
            icon: const Icon(Icons.favorite_outline_rounded),
            selectedIcon: const Icon(Icons.favorite_rounded),
            label: t.abaFavoritos,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings_rounded),
            label: t.abaAjustes,
          ),
        ],
      ),
    );
  }
}
