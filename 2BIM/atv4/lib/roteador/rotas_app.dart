import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:filmes/dados/modelos/videos_filme.dart';

import 'package:filmes/ui/tela_principal.dart';
import 'package:filmes/ui/telas/favoritos/tela_favoritos.dart';
import 'package:filmes/ui/telas/generos/tela_generos.dart';
import 'package:filmes/ui/telas/inicio/tela_inicio.dart';
import 'package:filmes/ui/telas/detalhes_filme/tela_detalhes_filme.dart';
import 'package:filmes/ui/telas/videos/tela_videos.dart';

part 'rotas_app.gr.dart';

@AutoRouterConfig()
class RoteadorApp extends _$RoteadorApp {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', initial: true, page: TelaPrincipalRoute.page, children: [
          AutoRoute(path: 'inicio', page: TelaInicioRoute.page),
          AutoRoute(path: 'generos', page: TelaGenerosRoute.page),
          AutoRoute(path: 'favoritos', page: TelaFavoritosRoute.page),
        ]),
        CustomRoute(
          path: '/detalhes/:movieId',
          page: TelaDetalhesFilmeRoute.page,
          maintainState: false,
          transitionsBuilder: TransitionsBuilders.slideBottom,
          durationInMilliseconds: 500,
        ),
        CustomRoute(
          page: TelaVideosRoute.page,
          maintainState: false,
          transitionsBuilder: TransitionsBuilders.slideRight,
          durationInMilliseconds: 500,
        ),
      ];
}
