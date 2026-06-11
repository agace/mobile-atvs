import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../dominio/entidades/produto.dart';
import '../provedores/provedores.dart';
import '../rotas/rotas.dart';
import 'cartao_produto.dart';

class CartaoProdutoConectado extends ConsumerWidget {
  const CartaoProdutoConectado({super.key, required this.produto});

  final Produto produto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ehFavorito = ref.watch(ehFavoritoProvider(produto.id));

    return CartaoProduto(
      produto: produto,
      ehFavorito: ehFavorito,
      aoFavoritar: () =>
          ref.read(repositorioFavoritosProvider).alternar(produto),
      aoTocar: () => context.pushNamed(
        Rotas.detalhes,
        pathParameters: {'id': '${produto.id}'},
        extra: produto,
      ),
    );
  }
}
