import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmes/roteador/rotas_app.dart';

import 'package:filmes/dados/modelos/filme.dart';
import 'package:filmes/provedores.dart';
import 'package:filmes/utilitarios/prefs.dart';
import 'package:filmes/utilitarios/utilitarios.dart';
import 'package:filmes/ui/viewmodel_filmes.dart';
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
  late Prefs prefs;
  List<GenreState> genreStates = [];
  List<Filme> currentMovieList = [];
  String termoBusca = '';
  Sorting ordenacao = Sorting.aToz;
  bool _buscaInicialFeita = false;

  @override
  void initState() {
    super.initState();
    // Restaura os valores salvos em SharedPreferences ao abrir a tela.
    prefs = ref.read(prefsProvider);
    termoBusca = prefs.ultimaBusca;
    ordenacao = prefs.ultimaOrdenacao;
  }

  @override
  Widget build(BuildContext context) {
    final viewModelFilmesAsync = ref.watch(viewModelFilmesProvider);
    return viewModelFilmesAsync.when(
      error: (e, st) => Text(e.toString()),
      loading: () => const NaoPronto(),
      data: (viewModel) {
        viewModelFilmes = viewModel;
        buildGenreState();
        // Refaz a ultima busca salva assim que o viewModel estiver pronto.
        if (!_buscaInicialFeita && termoBusca.isNotEmpty) {
          _buscaInicialFeita = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            pesquisar(termoBusca);
          });
        }
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

  // Executa a busca por filmes e salva o termo em SharedPreferences.
  Future<void> pesquisar(String termo) async {
    termoBusca = termo;
    await prefs.salvarUltimaBusca(termo);
    if (termo.isEmpty) {
      setState(() => currentMovieList = []);
      return;
    }
    final resposta = await viewModelFilmes.pesquisarFilmes(termo, 1);
    final filmes = resposta?.results
            .map((r) => Filme(
                  movieId: r.id,
                  image: getImageUrl(ImageSize.large, r.posterPath),
                  title: r.title,
                  overview: r.overview,
                  popularity: r.popularity,
                  releaseDate: r.releaseDate ?? DateTime(1900),
                ))
            .toList() ??
        [];
    setState(() {
      currentMovieList = filmes;
      aplicarOrdenacao();
    });
  }

  // Salva o criterio de ordenacao e reordena a lista atual.
  Future<void> aoOrdenar(Sorting novaOrdenacao) async {
    ordenacao = novaOrdenacao;
    await prefs.salvarUltimaOrdenacao(novaOrdenacao);
    setState(aplicarOrdenacao);
  }

  void aplicarOrdenacao() {
    currentMovieList = currentMovieList.sorted((a, b) {
      switch (ordenacao) {
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

  Widget buildScreen() {
    return SafeArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
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
                        LinhaPesquisaGenero(
                          pesquisar,
                          textoInicial: termoBusca,
                        ),
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
                  SeletorOrdenacao(
                    useSliver: true,
                    ordenacaoInicial: ordenacao,
                    onSortSelected: aoOrdenar,
                  ),
                  VerticalMovieList(
                    movies: currentMovieList,
                    onMovieTap: (movieId) {
                      context.router
                          .push(TelaDetalhesFilmeRoute(movieId: movieId));
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
