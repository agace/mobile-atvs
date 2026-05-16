import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmes/roteador/rotas_app.dart';

import 'package:filmes/dados/modelos/filme.dart';
import 'package:filmes/provedores.dart';
import 'package:filmes/ui/viewmodel_filmes.dart';
import 'package:filmes/ui/tema/tema.dart';
import 'package:filmes/ui/widgets/nao_pronto.dart';
import 'package:filmes/ui/widgets/divisor_sliver.dart';
import 'package:filmes/ui/widgets/lista_vertical_filmes.dart';
import 'package:filmes/ui/telas/generos/linha_pesquisa_genero.dart';
import 'package:filmes/ui/telas/generos/secao_generos.dart';
import 'package:filmes/ui/telas/generos/seletor_ordenacao.dart';

@RoutePage(name: 'TelaGenerosRoute')
class TelaGeneros extends ConsumerStatefulWidget {
  const TelaGeneros({super.key});

  @override
  ConsumerState<TelaGeneros> createState() => _GenreScreenState();
}

class _GenreScreenState extends ConsumerState<TelaGeneros> {
  final expandedNotifier = ValueNotifier<bool>(false);
  late ViewModelFilmes viewModelFilmes;
  List<GenreState> genreStates = [];
  List<Filme> currentMovieList = [];

  @override
  Widget build(BuildContext context) {
    final viewModelFilmesAsync = ref.watch(viewModelFilmesProvider);
    return viewModelFilmesAsync.when(
      error: (e, st) => Text(e.toString()),
      loading: () => const NaoPronto(),
      data: (viewModel) {
        viewModelFilmes = viewModel;
        buildGenreState();
        return buildScreen();
      },
    );
  }

  void buildGenreState() {
    genreStates.clear();
    for (final genre in viewModelFilmes.generosFilmes!) {
      genreStates.add(GenreState(genre: genre, isSelected: false));
    }
  }


  Widget buildScreen() {
    return SafeArea(
      child: Container(
        color: fundoTela,
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
                          padding:
                              const EdgeInsets.fromLTRB(16, 16.0, 0.0, 24.0),
                          child: Text('Find a Filme',
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        LinhaPesquisaGenero((searchString) {}),
                      ],
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                      valueListenable: expandedNotifier,
                      builder:
                          (BuildContext context, bool value, Widget? child) {
                        return SecaoGeneros(
                          genreStates: genreStates,
                          isExpanded: value,
                          onGenresExpanded: (expanded) {
                            expandedNotifier.value = expanded;
                          },
                          onGenresSelected: (List<GenreState> states) {},
                        );
                      }),
                  const DivisorSliver(),
                  SeletorOrdenacao(useSliver: true, onSortSelected: (sorting) {}),
                  VerticalMovieList(
                    movies: currentMovieList,
                    onMovieTap: (movieId) {
                      context.router.push(TelaDetalhesFilmeRoute(movieId: movieId));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
