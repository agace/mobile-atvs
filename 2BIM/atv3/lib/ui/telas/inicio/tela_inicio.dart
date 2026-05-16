import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmes/dados/modelos/resposta_filmes.dart';
import 'package:filmes/provedores.dart';
import 'package:filmes/ui/telas/inicio/linha_titulo.dart';

import 'package:filmes/roteador/rotas_app.dart';
import 'package:filmes/ui/viewmodel_filmes.dart';
import 'package:filmes/ui/tema/tema.dart';
import 'package:filmes/ui/widgets/widget_filme.dart';
import 'package:filmes/ui/widgets/nao_pronto.dart';
import 'package:filmes/ui/telas/inicio/imagem_tela_inicio.dart';
import 'package:filmes/ui/telas/inicio/filmes_horizontais.dart';

@RoutePage(name: 'TelaInicioRoute')
class TelaInicio extends ConsumerStatefulWidget {
  const TelaInicio({super.key});

  @override
  ConsumerState<TelaInicio> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<TelaInicio> {
  late ViewModelFilmes viewModelFilmes;
  Future<List<RespostaFilmes?>>? movieFuture;

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
      child: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if ((snapshot.connectionState != ConnectionState.active) &&
              (snapshot.connectionState != ConnectionState.done)) {
            return const NaoPronto();
          }
          return SingleChildScrollView(
            child: Container(
              color: fundoTela,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 24),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text('Now Playing', style: largeTitle)),
                  ),
                  ImagemTelaInicio(
                      viewModelFilmes: viewModelFilmes,
                      onMovieTap: (movieId) {
                        context.router.push(TelaDetalhesFilmeRoute(movieId: movieId));
                      }),
                  LinhaTitulo(
                    text: 'Trending',
                    onMoreClicked: () {},
                  ),
                  HorizontalMovies(
                    movies: viewModelFilmes.filmesEmAlta,
                    onMovieTap: onMovieTap,
                    movieType: MovieType.trending,
                  ),
                  LinhaTitulo(
                    text: 'Popular',
                    onMoreClicked: () {},
                  ),
                  HorizontalMovies(
                    movies: viewModelFilmes.filmesPopulares,
                    onMovieTap: onMovieTap,
                    movieType: MovieType.popular,
                  ),
                  LinhaTitulo(
                    text: 'Top Rated',
                    onMoreClicked: () {},
                  ),
                  HorizontalMovies(
                    movies: viewModelFilmes.filmesMaisBemAvaliados,
                    onMovieTap: onMovieTap,
                    movieType: MovieType.topRated,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void onMovieTap(int movieId) {
    context.router.push(TelaDetalhesFilmeRoute(movieId: movieId));
  }

  Future loadData() async {
    movieFuture ??= Future.wait([
      viewModelFilmes.getTrendingMovies(1),
      viewModelFilmes.buscarMaisBemAvaliados(1),
      viewModelFilmes.buscarPopulares(1),
      viewModelFilmes.buscarEmCartaz(1)
    ]);
    return movieFuture;
  }
}
