import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:filmes/dados/modelos/creditos_filme.dart';

import 'package:filmes/dados/modelos/detalhes_filme.dart';
import 'package:filmes/dados/modelos/videos_filme.dart';
import 'package:filmes/provedores.dart';
import 'package:filmes/roteador/rotas_app.dart';
import 'package:filmes/ui/viewmodel_filmes.dart';
import 'package:filmes/ui/tema/tema.dart';
import 'package:filmes/ui/widgets/elenco_horizontal.dart';
import 'package:filmes/ui/widgets/nao_pronto.dart';
import 'package:filmes/ui/telas/detalhes_filme/linha_botoes.dart';
import 'package:filmes/ui/telas/detalhes_filme/imagem_detalhes.dart';
import 'package:filmes/ui/telas/detalhes_filme/linha_generos.dart';
import 'package:filmes/ui/telas/detalhes_filme/sinopse_filme.dart';
import 'package:filmes/ui/telas/detalhes_filme/trailer.dart';

@RoutePage(name: 'TelaDetalhesFilmeRoute')
class TelaDetalhesFilme extends ConsumerStatefulWidget {
  final int movieId;

  const TelaDetalhesFilme(@PathParam('movieId') this.movieId, {super.key});

  @override
  ConsumerState<TelaDetalhesFilme> createState() => _MovieDetailState();
}

class _MovieDetailState extends ConsumerState<TelaDetalhesFilme> {
  final favoriteNotifier = ValueNotifier<bool>(false);
  late ViewModelFilmes viewModelFilmes;
  CreditosFilme? credits;
  VideosFilme? movieVideos;

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
    return FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const NaoPronto();
          }
          if (snapshot.hasError) {
            logMessage('Error: ${snapshot.error.toString()}');
            return Text(snapshot.error.toString());
          }
          final movieDetails = snapshot.data as DetalhesFilme?;
          if (movieDetails == null) {
            return const NaoPronto();
          }
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: fundoTela,
                leading: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    context.router.maybePopTop();
                  },
                ),
                centerTitle: false,
                title: Text('Back',
                    style: Theme.of(context).textTheme.headlineMedium),
              ),
              body: Container(
                color: fundoTela,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: CustomScrollView(slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate([
                            Stack(children: [
                              ImagemDetalhes(details: movieDetails)
                            ]),
                            LinhaGeneros(genres: movieDetails.genres),
                            SinopseFilme(
                                details: movieDetails),
                            ValueListenableBuilder<bool>(
                              valueListenable: favoriteNotifier,
                              builder: (BuildContext context, bool value,
                                  Widget? child) {
                                return LinhaBotoes(
                                  favoriteSelected: favoriteNotifier.value,
                                  onFavoriteSelected: () async {
                                    if (favoriteNotifier.value) {
                                      favoriteNotifier.value = false;
                                    } else {
                                      favoriteNotifier.value = true;
                                    }
                                  },
                                );
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, bottom: 8),
                              child: Text('Trailers',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge),
                            ),
                            Trailer(
                              movieVideos: movieVideos?.results,
                              onVideoTap: (video) {
                                  context.router
                                      .push(TelaVideosRoute(movieVideo: video));
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, bottom: 16, top: 16),
                              child: Text('Cast', style: Theme.of(context).textTheme.headlineLarge),
                            ),
                          ]),
                        ),
                        HorizontalCast(castList: credits?.cast ?? []),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future loadData() async {
    credits = await viewModelFilmes.buscarCreditosFilme(widget.movieId);
    movieVideos = await viewModelFilmes.buscarVideosFilme(widget.movieId);
    return viewModelFilmes.buscarDetalhesFilme(widget.movieId);
  }
}
