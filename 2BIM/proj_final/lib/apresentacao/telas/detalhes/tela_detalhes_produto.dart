import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../dominio/entidades/produto.dart';
import '../../../dominio/regras/regras_produto.dart';
import '../../../nucleo/formatador.dart';
import '../../../nucleo/i18n/textos.dart';
import '../../../nucleo/tema/marca.dart';
import '../../provedores/provedores.dart';

class TelaDetalhesProduto extends ConsumerStatefulWidget {
  const TelaDetalhesProduto({
    super.key,
    required this.produtoId,
    this.produtoInicial,
  });

  final int produtoId;
  final Produto? produtoInicial;

  @override
  ConsumerState<TelaDetalhesProduto> createState() =>
      _TelaDetalhesProdutoState();
}

class _TelaDetalhesProdutoState extends ConsumerState<TelaDetalhesProduto> {
  int _quantidade = 1;

  @override
  Widget build(BuildContext context) {
    final t = Textos.of(context);
    final detalheAsync = ref.watch(detalheProdutoProvider(widget.produtoId));
    final produto = detalheAsync.valueOrNull ?? widget.produtoInicial;

    if (produto == null) {
      return Scaffold(
        appBar: AppBar(),
        body: detalheAsync.hasError
            ? Center(child: Text(t.detalheFalhaCarregar))
            : const Center(child: CircularProgressIndicator()),
      );
    }

    final tema = Theme.of(context);
    final ehFavorito = ref.watch(ehFavoritoProvider(produto.id));
    final precoFinal = RegrasProduto.precoComDesconto(produto);
    final imagens = produto.imagens.isNotEmpty
        ? produto.imagens
        : [produto.miniatura];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 360,
            pinned: true,
            backgroundColor: tema.colorScheme.surface,
            surfaceTintColor: Colors.transparent,
            leading: const _BotaoCircular(child: BackButton()),
            actions: [
              _BotaoCircular(
                child: IconButton(
                  icon: Icon(
                    ehFavorito ? Icons.favorite : Icons.favorite_border,
                    color: ehFavorito ? Marca.alerta : null,
                  ),
                  onPressed: () =>
                      ref.read(repositorioFavoritosProvider).alternar(produto),
                ),
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: _Galeria(imagens: imagens),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              transform: Matrix4.translationValues(0, -24, 0),
              decoration: BoxDecoration(
                color: tema.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(Marca.raioGrande),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produto.marca.isEmpty
                        ? produto.categoria.toUpperCase()
                        : produto.marca.toUpperCase(),
                    style: tema.textTheme.labelMedium?.copyWith(
                      color: tema.colorScheme.primary,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    produto.titulo,
                    style: tema.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      _Selo(
                        icone: Icons.star_rounded,
                        cor: tema.colorScheme.onSurface,
                        texto: produto.avaliacao.toStringAsFixed(1),
                      ),
                      const SizedBox(width: 10),
                      _Selo(
                        icone: produto.disponivel
                            ? Icons.check_circle_rounded
                            : Icons.cancel_rounded,
                        cor: produto.disponivel ? Marca.positivo : Marca.alerta,
                        texto: produto.disponivel
                            ? t.emEstoque
                            : t.indisponivel,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        Formatador.moeda(precoFinal),
                        style: tema.textTheme.headlineMedium?.copyWith(
                          color: tema.colorScheme.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      if (produto.temDesconto) ...[
                        const SizedBox(width: 12),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            Formatador.moeda(produto.preco),
                            style: tema.textTheme.titleMedium?.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: tema.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    t.descricao,
                    style: tema.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    produto.descricao,
                    style: tema.textTheme.bodyMedium?.copyWith(
                      color: tema.colorScheme.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _BarraCompra(
        produto: produto,
        quantidade: _quantidade,
        precoUnitario: precoFinal,
        aoAlterar: (q) => setState(() => _quantidade = q),
        aoAdicionar: () => _adicionar(produto),
      ),
    );
  }

  Future<void> _adicionar(Produto produto) async {
    final repo = ref.read(repositorioCarrinhoProvider);
    for (var i = 0; i < _quantidade; i++) {
      await repo.adicionar(produto);
    }
    if (!mounted) return;

    ref.read(abaProvider.notifier).state = Aba.carrinho;
    if (context.canPop()) context.pop();
  }
}

class _Galeria extends StatefulWidget {
  const _Galeria({required this.imagens});

  final List<String> imagens;

  @override
  State<_Galeria> createState() => _GaleriaState();
}

class _GaleriaState extends State<_Galeria> {
  final _controle = PageController();
  int _atual = 0;

  @override
  void dispose() {
    _controle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return ColoredBox(
      color: tema.colorScheme.surface,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _controle,
            onPageChanged: (i) => setState(() => _atual = i),
            itemCount: widget.imagens.length,
            itemBuilder: (_, i) => Padding(
              padding: const EdgeInsets.fromLTRB(24, 80, 24, 40),
              child: CachedNetworkImage(
                imageUrl: widget.imagens[i],
                fit: BoxFit.contain,
                errorWidget: (_, _, _) =>
                    const Icon(Icons.image_outlined, size: 80),
              ),
            ),
          ),
          if (widget.imagens.length > 1)
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < widget.imagens.length; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: _atual == i ? 18 : 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: _atual == i
                            ? tema.colorScheme.onSurface
                            : tema.colorScheme.outlineVariant,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _BotaoCircular extends StatelessWidget {
  const _BotaoCircular({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.85),
        shape: BoxShape.circle,
      ),
      child: child,
    );
  }
}

class _Selo extends StatelessWidget {
  const _Selo({required this.icone, required this.cor, required this.texto});

  final IconData icone;
  final Color cor;
  final String texto;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: cor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icone, size: 16, color: cor),
          const SizedBox(width: 5),
          Text(
            texto,
            style: tema.textTheme.labelMedium?.copyWith(
              color: cor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _BarraCompra extends StatelessWidget {
  const _BarraCompra({
    required this.produto,
    required this.quantidade,
    required this.precoUnitario,
    required this.aoAlterar,
    required this.aoAdicionar,
  });

  final Produto produto;
  final int quantidade;
  final double precoUnitario;
  final ValueChanged<int> aoAlterar;
  final VoidCallback aoAdicionar;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final t = Textos.of(context);
    final total = (precoUnitario * quantidade * 100).roundToDouble() / 100;

    return Container(
      decoration: BoxDecoration(
        color: tema.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Row(
            children: [
              if (produto.disponivel) ...[
                _Passo(
                  icone: Icons.remove_rounded,
                  aoTocar: quantidade > 1
                      ? () => aoAlterar(quantidade - 1)
                      : null,
                ),
                SizedBox(
                  width: 36,
                  child: Text(
                    '$quantidade',
                    textAlign: TextAlign.center,
                    style: tema.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                _Passo(
                  icone: Icons.add_rounded,
                  aoTocar: () => aoAlterar(quantidade + 1),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: FilledButton.icon(
                  onPressed: produto.disponivel ? aoAdicionar : null,
                  icon: const Icon(Icons.shopping_bag_outlined),
                  label: Text(
                    produto.disponivel
                        ? t.adicionar(Formatador.moeda(total))
                        : t.indisponivel,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Passo extends StatelessWidget {
  const _Passo({required this.icone, required this.aoTocar});

  final IconData icone;
  final VoidCallback? aoTocar;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Material(
      color: tema.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: aoTocar,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icone,
            size: 20,
            color: aoTocar == null ? tema.disabledColor : null,
          ),
        ),
      ),
    );
  }
}
