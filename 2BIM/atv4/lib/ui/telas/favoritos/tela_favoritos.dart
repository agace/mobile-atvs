import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:filmes/dados/banco/banco_dados.dart';
import 'package:filmes/provedores.dart';
import 'package:filmes/roteador/rotas_app.dart';
import 'package:filmes/utilitarios/utilitarios.dart';
import 'package:filmes/ui/viewmodel_filmes.dart';
import 'package:filmes/ui/widgets/nao_pronto.dart';
import 'package:filmes/ui/widgets/lista_vertical_favoritos.dart';
import 'package:filmes/ui/telas/generos/seletor_ordenacao.dart';

@RoutePage(name: 'TelaFavoritosRoute')
class TelaFavoritos extends ConsumerStatefulWidget {
  const TelaFavoritos({super.key});

  @override
  ConsumerState<TelaFavoritos> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<TelaFavoritos> {
  late ViewModelFilmes viewModelFilmes;
  Sorting selectedSort = Sorting.aToz;

  @override
  Widget build(BuildContext context) {
    final viewModelFilmesAsync = ref.watch(viewModelFilmesProvider);
    return viewModelFilmesAsync.when(
      error: (e, st) => Text(e.toString()),
      loading: () => const NaoPronto(),
      data: (viewModel) {
        viewModelFilmes = viewModel;
        return buildScreen();
      },
    );
  }

  Widget buildScreen() {
    return SafeArea(
      child: StreamBuilder<List<Favorito>>(
        stream: viewModelFilmes.fluxoFavoritos(),
        builder: (context, snapshot) {
          if ((snapshot.connectionState != ConnectionState.active) &&
              (snapshot.connectionState != ConnectionState.done)) {
            return const NaoPronto();
          }
          final favoritos = ordenar(snapshot.data ?? []);
          return Scaffold(
            body: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16, 16.0, 0.0, 24.0),
                                child: Text('My Favorites',
                                    style:
                                        Theme.of(context).textTheme.titleLarge),
                              ),
                            ],
                          ),
                        ),
                        SeletorOrdenacao(
                            useSliver: true,
                            ordenacaoInicial: selectedSort,
                            onSortSelected: (sorting) {
                              setState(() {
                                selectedSort = sorting;
                              });
                            }),
                        VerticalFavoriteList(
                          favorites: favoritos,
                          viewModelFilmes: viewModelFilmes,
                          onMovieTap: (movieId) {
                            context.router
                                .push(TelaDetalhesFilmeRoute(movieId: movieId));
                          },
                          onFavoritesTap: (Favorito favorite) {
                            // Desfavoritar remove o item do banco local.
                            viewModelFilmes.desfavoritar(favorite.movieId);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  List<Favorito> ordenar(List<Favorito> favoritos) {
    return favoritos.sorted((a, b) {
      switch (selectedSort) {
        case Sorting.aToz:
          return a.title.compareTo(b.title);
        case Sorting.zToa:
          return b.title.compareTo(a.title);
        case Sorting.rating:
          return b.popularity.compareTo(a.popularity);
        case Sorting.year:
          return a.releaseDate.compareTo(b.releaseDate);
      }
    });
  }
}
