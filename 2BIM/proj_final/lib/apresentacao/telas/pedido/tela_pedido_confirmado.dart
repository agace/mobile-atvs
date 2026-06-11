import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../nucleo/formatador.dart';
import '../../../nucleo/i18n/textos.dart';
import '../../../nucleo/tema/marca.dart';
import '../../provedores/provedores.dart';

class ResumoPedido {
  const ResumoPedido({
    required this.numero,
    required this.itens,
    required this.total,
  });

  final String numero;
  final int itens;
  final double total;
}

class TelaPedidoConfirmado extends ConsumerWidget {
  const TelaPedidoConfirmado({super.key, required this.pedido});

  final ResumoPedido pedido;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tema = Theme.of(context);
    final t = Textos.of(context);
    final entrega = DateTime.now().add(const Duration(days: 5));

    void voltarAsCompras() {
      ref.read(abaProvider.notifier).state = Aba.catalogo;
      context.go('/');
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) voltarAsCompras();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Spacer(),
                Container(
                  width: 96,
                  height: 96,
                  decoration: const BoxDecoration(
                    color: Marca.acento,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    size: 52,
                    color: Marca.tinta,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  t.pedidoConfirmadoTitulo,
                  style: tema.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  t.pedidoConfirmadoMensagem,
                  textAlign: TextAlign.center,
                  style: tema.textTheme.bodyMedium?.copyWith(
                    color: tema.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 28),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: tema.colorScheme.surface,
                    borderRadius: BorderRadius.circular(Marca.raio),
                    border: Border.all(color: tema.colorScheme.outlineVariant),
                  ),
                  child: Column(
                    children: [
                      _Linha(rotulo: t.rotuloPedido, valor: pedido.numero),
                      const SizedBox(height: 14),
                      _Linha(rotulo: t.rotuloItens, valor: '${pedido.itens}'),
                      const SizedBox(height: 14),
                      _Linha(
                        rotulo: t.rotuloTotalPago,
                        valor: Formatador.moeda(pedido.total),
                        destaque: true,
                      ),
                      const Divider(height: 28),
                      Row(
                        children: [
                          Icon(
                            Icons.local_shipping_outlined,
                            size: 20,
                            color: tema.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              t.entregaEstimada,
                              style: tema.textTheme.bodyMedium?.copyWith(
                                color: tema.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                          Text(
                            t.entregaAte(Formatador.dataCurta(entrega)),
                            style: tema.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: voltarAsCompras,
                    child: Text(t.continuarComprando),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Linha extends StatelessWidget {
  const _Linha({
    required this.rotulo,
    required this.valor,
    this.destaque = false,
  });

  final String rotulo;
  final String valor;
  final bool destaque;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          rotulo,
          style: tema.textTheme.bodyMedium?.copyWith(
            color: tema.colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          valor,
          style: destaque
              ? tema.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                )
              : tema.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
        ),
      ],
    );
  }
}
