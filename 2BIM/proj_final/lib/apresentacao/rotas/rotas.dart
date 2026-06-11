import 'package:go_router/go_router.dart';

import '../../dominio/entidades/produto.dart';
import '../telas/casca/tela_casca.dart';
import '../telas/detalhes/tela_detalhes_produto.dart';
import '../telas/pedido/tela_pedido_confirmado.dart';

abstract class Rotas {
  static const inicio = 'inicio';
  static const detalhes = 'detalhes';
  static const pedidoConfirmado = 'pedido-confirmado';
}

final roteador = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: Rotas.inicio,
      builder: (context, state) => const TelaCasca(),
    ),
    GoRoute(
      path: '/produto/:id',
      name: Rotas.detalhes,
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        final produtoInicial = state.extra as Produto?;
        return TelaDetalhesProduto(
          produtoId: id,
          produtoInicial: produtoInicial,
        );
      },
    ),
    GoRoute(
      path: '/pedido-confirmado',
      name: Rotas.pedidoConfirmado,
      builder: (context, state) =>
          TelaPedidoConfirmado(pedido: state.extra as ResumoPedido),
    ),
  ],
);
