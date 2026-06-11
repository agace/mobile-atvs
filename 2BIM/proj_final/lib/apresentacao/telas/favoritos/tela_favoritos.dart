import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../nucleo/i18n/textos.dart';
import '../../provedores/provedores.dart';
import '../../widgets/aviso_vazio.dart';
import '../../widgets/cartao_produto_conectado.dart';

class TelaFavoritos extends ConsumerWidget {
  const TelaFavoritos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Textos.of(context);
    final favoritosAsync = ref.watch(favoritosProvider);

    return Scaffold(
      appBar: AppBar(title: Text(t.favoritosTitulo)),
      body: favoritosAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(t.favoritosErro)),
        data: (favoritos) {
          if (favoritos.isEmpty) {
            return AvisoVazio(
              icone: Icons.favorite_border_rounded,
              titulo: t.favoritosVazioTitulo,
              descricao: t.favoritosVazioDescricao,
              acao: FilledButton(
                onPressed: () =>
                    ref.read(abaProvider.notifier).state = Aba.catalogo,
                child: Text(t.explorarCatalogo),
              ),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.66,
            ),
            itemCount: favoritos.length,
            itemBuilder: (_, i) =>
                CartaoProdutoConectado(produto: favoritos[i]),
          );
        },
      ),
    );
  }
}
