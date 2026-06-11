import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../dominio/regras/regras_produto.dart';
import '../../../nucleo/i18n/textos.dart';
import '../../provedores/provedores.dart';
import '../../widgets/aviso_vazio.dart';
import '../../widgets/cartao_produto_conectado.dart';
import '../../widgets/esqueleto.dart';
import '../../widgets/logo_marca.dart';
import '../../widgets/painel_notificacoes.dart';
import 'banner_promocional.dart';
import 'filtro_categorias.dart';

class TelaCatalogo extends ConsumerStatefulWidget {
  const TelaCatalogo({super.key});

  @override
  ConsumerState<TelaCatalogo> createState() => _TelaCatalogoState();
}

class _TelaCatalogoState extends ConsumerState<TelaCatalogo> {
  final _controleBusca = TextEditingController();

  @override
  void dispose() {
    _controleBusca.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Textos.of(context);
    final produtosAsync = ref.watch(produtosProvider);
    final filtro = ref.watch(controladorFiltroProvider);
    final buscando = filtro.termo.trim().isNotEmpty;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _Cabecalho()),
            SliverToBoxAdapter(child: _CampoBusca(controle: _controleBusca)),
            if (!buscando && filtro.categoria == null) ...[
              const SliverToBoxAdapter(child: SizedBox(height: 8)),
              const SliverToBoxAdapter(child: BannerPromocional()),
            ],
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            const SliverToBoxAdapter(child: FiltroCategorias()),
            SliverToBoxAdapter(
              child: _TituloSecao(ordenacao: filtro.ordenacao),
            ),
            produtosAsync.when(
              loading: () => const SliverToBoxAdapter(child: EsqueletoGrade()),
              error: (e, _) => SliverFillRemaining(
                hasScrollBody: false,
                child: AvisoVazio(
                  icone: Icons.wifi_off_rounded,
                  titulo: t.catErroTitulo,
                  descricao: t.catErroDescricao,
                ),
              ),
              data: (produtos) {
                if (produtos.isEmpty) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: AvisoVazio(
                      icone: Icons.search_off_rounded,
                      titulo: t.catVazioTitulo,
                      descricao: t.catVazioDescricao,
                    ),
                  );
                }
                return SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.66,
                        ),
                    delegate: SliverChildBuilderDelegate(
                      (_, i) => CartaoProdutoConectado(produto: produtos[i]),
                      childCount: produtos.length,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Cabecalho extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tema = Theme.of(context);
    final naoLidas = ref.watch(notificacoesNaoLidasProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Row(
        children: [
          const LogoMarca(tamanho: 26),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: tema.colorScheme.surface,
              shape: BoxShape.circle,
              border: Border.all(color: tema.colorScheme.outlineVariant),
            ),
            child: IconButton(
              onPressed: () => abrirPainelNotificacoes(context, ref),
              tooltip: Textos.of(context).notificacoesTooltip,
              icon: Badge(
                isLabelVisible: naoLidas > 0,
                label: Text('$naoLidas'),
                child: const Icon(Icons.notifications_none_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CampoBusca extends ConsumerWidget {
  const _CampoBusca({required this.controle});

  final TextEditingController controle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: TextField(
        controller: controle,
        textInputAction: TextInputAction.search,
        onSubmitted: (texto) =>
            ref.read(controladorFiltroProvider.notifier).definirTermo(texto),
        decoration: InputDecoration(
          hintText: Textos.of(context).buscaHint,
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: ValueListenableBuilder(
            valueListenable: controle,
            builder: (context, valor, _) {
              if (valor.text.isEmpty) return const SizedBox.shrink();
              return IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () {
                  controle.clear();
                  ref.read(controladorFiltroProvider.notifier).definirTermo('');
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TituloSecao extends ConsumerWidget {
  const _TituloSecao({required this.ordenacao});

  final CriterioOrdenacao ordenacao;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tema = Theme.of(context);
    final t = Textos.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
      child: Row(
        children: [
          Text(
            t.secaoProdutos,
            style: tema.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: () => _abrirOrdenacao(context, ref),
            icon: const Icon(Icons.swap_vert_rounded, size: 20),
            label: Text(t.rotuloOrdenacao(ordenacao)),
          ),
        ],
      ),
    );
  }

  void _abrirOrdenacao(BuildContext context, WidgetRef ref) {
    final t = Textos.of(context);
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final criterio in CriterioOrdenacao.values)
              ListTile(
                leading: Icon(
                  ordenacao == criterio
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                ),
                title: Text(t.rotuloOrdenacao(criterio)),
                onTap: () {
                  ref
                      .read(controladorFiltroProvider.notifier)
                      .definirOrdenacao(criterio);
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      ),
    );
  }
}
