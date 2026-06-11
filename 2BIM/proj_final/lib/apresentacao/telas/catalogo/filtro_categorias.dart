import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../nucleo/i18n/textos.dart';
import '../../provedores/provedores.dart';

class FiltroCategorias extends ConsumerWidget {
  const FiltroCategorias({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriasAsync = ref.watch(categoriasProvider);
    final selecionada = ref.watch(controladorFiltroProvider).categoria;

    return categoriasAsync.when(
      loading: () => const SizedBox(height: 44),
      error: (_, _) => const SizedBox.shrink(),
      data: (categorias) {
        return SizedBox(
          height: 44,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categorias.length + 1,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (_, i) {
              if (i == 0) {
                return _Chip(
                  rotulo: Textos.of(context).categoriaTodas,
                  selecionado: selecionada == null,
                  aoTocar: () => ref
                      .read(controladorFiltroProvider.notifier)
                      .selecionarCategoria(null),
                );
              }
              final categoria = categorias[i - 1];
              return _Chip(
                rotulo: categoria.nome,
                selecionado: selecionada == categoria.slug,
                aoTocar: () => ref
                    .read(controladorFiltroProvider.notifier)
                    .selecionarCategoria(categoria.slug),
              );
            },
          ),
        );
      },
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.rotulo,
    required this.selecionado,
    required this.aoTocar,
  });

  final String rotulo;
  final bool selecionado;
  final VoidCallback aoTocar;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return GestureDetector(
      onTap: aoTocar,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: selecionado
              ? tema.colorScheme.primary
              : tema.colorScheme.surface,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: selecionado
                ? tema.colorScheme.primary
                : tema.colorScheme.outlineVariant,
          ),
        ),
        child: Text(
          rotulo,
          style: tema.textTheme.labelLarge?.copyWith(
            color: selecionado
                ? tema.colorScheme.onPrimary
                : tema.colorScheme.onSurface,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
