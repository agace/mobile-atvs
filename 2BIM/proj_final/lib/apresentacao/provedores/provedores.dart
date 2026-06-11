import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dados/fontes/banco_local.dart';
import '../../dados/fontes/fonte_api_produtos.dart';
import '../../dados/repositorios/repositorio_carrinho_impl.dart';
import '../../dados/repositorios/repositorio_favoritos_impl.dart';
import '../../dados/repositorios/repositorio_produtos_impl.dart';
import '../../dominio/entidades/categoria.dart';
import '../../dominio/entidades/item_carrinho.dart';
import '../../dominio/entidades/notificacao.dart';
import '../../dominio/entidades/produto.dart';
import '../../dominio/regras/regras_produto.dart';
import '../../dominio/repositorios/repositorio_carrinho.dart';
import '../../dominio/repositorios/repositorio_favoritos.dart';
import '../../dominio/repositorios/repositorio_produtos.dart';
import '../../nucleo/prefs.dart';
import '../../nucleo/rede/cliente_dio.dart';
import 'controlador_filtro.dart';
import 'controlador_idioma.dart';
import 'controlador_notificacoes.dart';
import 'controlador_tema.dart';

final prefsProvider = Provider<Prefs>(
  (ref) => throw UnimplementedError('prefsProvider deve ser sobrescrito'),
);

final notificacoesProvider =
    StateNotifierProvider<ControladorNotificacoes, List<Notificacao>>(
      (ref) => ControladorNotificacoes(),
    );

final notificacoesNaoLidasProvider = Provider<int>((ref) {
  return ref.watch(notificacoesProvider).where((n) => !n.lida).length;
});

final bancoLocalProvider = Provider<BancoLocal>((ref) {
  final banco = BancoLocal();
  ref.onDispose(banco.close);
  return banco;
});

final dioProvider = Provider<Dio>((ref) {
  final dio = criarClienteDio();
  ref.onDispose(dio.close);
  return dio;
});

final fonteApiProdutosProvider = Provider<FonteApiProdutos>(
  (ref) => FonteApiProdutos(ref.watch(dioProvider)),
);

final repositorioProdutosProvider = Provider<RepositorioProdutos>(
  (ref) => RepositorioProdutosImpl(ref.watch(fonteApiProdutosProvider)),
);

final repositorioCarrinhoProvider = Provider<RepositorioCarrinho>(
  (ref) => RepositorioCarrinhoImpl(ref.watch(bancoLocalProvider)),
);

final repositorioFavoritosProvider = Provider<RepositorioFavoritos>(
  (ref) => RepositorioFavoritosImpl(ref.watch(bancoLocalProvider)),
);

final controladorTemaProvider = StateNotifierProvider<ControladorTema, bool>((
  ref,
) {
  return ControladorTema(ref.watch(prefsProvider));
});

final controladorIdiomaProvider =
    StateNotifierProvider<ControladorIdioma, String>((ref) {
      return ControladorIdioma(ref.watch(prefsProvider));
    });

abstract class Aba {
  static const int catalogo = 0;
  static const int carrinho = 1;
  static const int favoritos = 2;
  static const int ajustes = 3;
}

final abaProvider = StateProvider<int>((ref) => Aba.catalogo);

final controladorFiltroProvider =
    StateNotifierProvider<ControladorFiltro, EstadoFiltro>((ref) {
      return ControladorFiltro();
    });

final categoriasProvider = FutureProvider<List<Categoria>>((ref) {
  return ref.watch(repositorioProdutosProvider).listarCategorias();
});

final produtosProvider = FutureProvider<List<Produto>>((ref) async {
  final filtro = ref.watch(controladorFiltroProvider);
  final repo = ref.watch(repositorioProdutosProvider);

  final List<Produto> produtos;
  if (filtro.termo.trim().isNotEmpty) {
    produtos = await repo.buscarProdutos(filtro.termo.trim());
  } else if (filtro.categoria != null) {
    produtos = await repo.listarPorCategoria(filtro.categoria!);
  } else {
    produtos = await repo.listarProdutos();
  }

  return RegrasProduto.ordenar(produtos, filtro.ordenacao);
});

final detalheProdutoProvider = FutureProvider.family<Produto, int>((ref, id) {
  return ref.watch(repositorioProdutosProvider).detalhe(id);
});

final itensCarrinhoProvider = StreamProvider<List<ItemCarrinho>>((ref) {
  return ref.watch(repositorioCarrinhoProvider).observarItens();
});

final favoritosProvider = StreamProvider<List<Produto>>((ref) {
  return ref.watch(repositorioFavoritosProvider).observar();
});

final ehFavoritoProvider = Provider.family<bool, int>((ref, produtoId) {
  final favoritos = ref.watch(favoritosProvider).valueOrNull ?? const [];
  return favoritos.any((p) => p.id == produtoId);
});
