import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../dominio/entidades/item_carrinho.dart';
import '../../../dominio/regras/regras_carrinho.dart';
import '../../../dominio/repositorios/repositorio_carrinho.dart';
import '../../../nucleo/formatador.dart';
import '../../../nucleo/i18n/textos.dart';
import '../../../nucleo/tema/marca.dart';
import '../../provedores/provedores.dart';
import '../../rotas/rotas.dart';
import '../../widgets/aviso_vazio.dart';
import '../pedido/tela_pedido_confirmado.dart';

class TelaCarrinho extends ConsumerWidget {
  const TelaCarrinho({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Textos.of(context);
    final itensAsync = ref.watch(itensCarrinhoProvider);
    final repo = ref.read(repositorioCarrinhoProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.carrinhoTitulo),
        actions: [
          itensAsync.maybeWhen(
            data: (itens) => itens.isEmpty
                ? const SizedBox.shrink()
                : IconButton(
                    icon: const Icon(Icons.delete_sweep_outlined),
                    tooltip: t.esvaziarTooltip,
                    onPressed: repo.limpar,
                  ),
            orElse: () => const SizedBox.shrink(),
          ),
        ],
      ),
      body: itensAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(t.carrinhoErro)),
        data: (itens) {
          if (itens.isEmpty) {
            return AvisoVazio(
              icone: Icons.shopping_cart_outlined,
              titulo: t.carrinhoVazioTitulo,
              descricao: t.carrinhoVazioDescricao,
              acao: FilledButton(
                onPressed: () =>
                    ref.read(abaProvider.notifier).state = Aba.catalogo,
                child: Text(t.explorarCatalogo),
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: itens.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (_, i) =>
                      _CartaoItem(item: itens[i], repo: repo),
                ),
              ),
              _Resumo(itens: itens),
            ],
          );
        },
      ),
    );
  }
}

class _CartaoItem extends StatelessWidget {
  const _CartaoItem({required this.item, required this.repo});

  final ItemCarrinho item;
  final RepositorioCarrinho repo;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final subtotal = RegrasCarrinho.subtotalItem(item);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: tema.colorScheme.surface,
        borderRadius: BorderRadius.circular(Marca.raio),
        border: Border.all(color: tema.colorScheme.outlineVariant),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 72,
              height: 72,
              color: tema.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.4,
              ),
              padding: const EdgeInsets.all(6),
              child: CachedNetworkImage(
                imageUrl: item.miniatura,
                fit: BoxFit.contain,
                errorWidget: (_, _, _) => const Icon(Icons.image_outlined),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.titulo,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: tema.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  Formatador.moeda(subtotal),
                  style: tema.textTheme.titleMedium?.copyWith(
                    color: tema.colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                _Stepper(item: item, repo: repo),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.delete_outline_rounded,
              color: tema.colorScheme.onSurfaceVariant,
            ),
            onPressed: () => repo.remover(item.produtoId),
          ),
        ],
      ),
    );
  }
}

class _Stepper extends StatelessWidget {
  const _Stepper({required this.item, required this.repo});

  final ItemCarrinho item;
  final RepositorioCarrinho repo;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: tema.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Mini(
            icone: Icons.remove_rounded,
            aoTocar: () =>
                repo.definirQuantidade(item.produtoId, item.quantidade - 1),
          ),
          SizedBox(
            width: 28,
            child: Text(
              '${item.quantidade}',
              textAlign: TextAlign.center,
              style: tema.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          _Mini(
            icone: Icons.add_rounded,
            aoTocar: () =>
                repo.definirQuantidade(item.produtoId, item.quantidade + 1),
          ),
        ],
      ),
    );
  }
}

class _Mini extends StatelessWidget {
  const _Mini({required this.icone, required this.aoTocar});

  final IconData icone;
  final VoidCallback aoTocar;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: aoTocar,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Icon(icone, size: 18),
      ),
    );
  }
}

class _Resumo extends ConsumerWidget {
  const _Resumo({required this.itens});

  final List<ItemCarrinho> itens;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tema = Theme.of(context);
    final t = Textos.of(context);
    final subtotal = RegrasCarrinho.total(itens);
    final economia = RegrasCarrinho.economiaTotal(itens);
    final frete = RegrasCarrinho.frete(subtotal);
    final falta = RegrasCarrinho.faltaParaFreteGratis(subtotal);
    final totalAPagar = RegrasCarrinho.totalAPagar(itens);

    return Container(
      decoration: BoxDecoration(
        color: tema.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(Marca.raioGrande),
        ),
        border: Border(top: BorderSide(color: tema.colorScheme.outlineVariant)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (falta > 0) ...[
                _AvisoFrete(falta: falta),
                const SizedBox(height: 16),
              ],
              _Linha(rotulo: t.subtotal, valor: Formatador.moeda(subtotal)),
              if (economia > 0) ...[
                const SizedBox(height: 8),
                _Linha(
                  rotulo: t.economia,
                  valor: '- ${Formatador.moeda(economia)}',
                  cor: Marca.positivo,
                ),
              ],
              const SizedBox(height: 8),
              _Linha(
                rotulo: t.frete,
                valor: frete == 0 ? t.gratis : Formatador.moeda(frete),
                cor: frete == 0 ? Marca.positivo : null,
              ),
              const Divider(height: 28),
              _Linha(
                rotulo: t.total,
                valor: Formatador.moeda(totalAPagar),
                destaque: true,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => _finalizar(context, ref, totalAPagar),
                  icon: const Icon(Icons.lock_outline_rounded),
                  label: Text(t.finalizarCompra),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _finalizar(
    BuildContext context,
    WidgetRef ref,
    double total,
  ) async {
    final agora = DateTime.now();
    final pedido = ResumoPedido(
      numero:
          'ECR-${(agora.millisecondsSinceEpoch % 1000000).toString().padLeft(6, '0')}',
      itens: RegrasCarrinho.quantidadeTotal(itens),
      total: total,
    );

    final t = Textos.of(context);
    ref
        .read(notificacoesProvider.notifier)
        .adicionar(
          titulo: t.compraNotifTitulo(pedido.numero),
          mensagem: t.compraNotifMensagem(Formatador.moeda(pedido.total)),
        );

    context.pushNamed(Rotas.pedidoConfirmado, extra: pedido);
    await ref.read(repositorioCarrinhoProvider).limpar();
  }
}

class _AvisoFrete extends StatelessWidget {
  const _AvisoFrete({required this.falta});

  final double falta;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final t = Textos.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: tema.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(Marca.raio),
      ),
      child: Row(
        children: [
          const Icon(Icons.local_shipping_outlined, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: t.freteFaltaPrefixo),
                  TextSpan(
                    text: Formatador.moeda(falta),
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  TextSpan(text: t.freteFaltaSufixo),
                ],
              ),
              style: tema.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}

class _Linha extends StatelessWidget {
  const _Linha({
    required this.rotulo,
    required this.valor,
    this.destaque = false,
    this.cor,
  });

  final String rotulo;
  final String valor;
  final bool destaque;
  final Color? cor;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final estilo = destaque
        ? tema.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)
        : tema.textTheme.bodyMedium;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(rotulo, style: estilo),
        Text(
          valor,
          style: estilo?.copyWith(color: cor ?? tema.colorScheme.primary),
        ),
      ],
    );
  }
}
