// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'rotas_app.dart';

abstract class _$RoteadorApp extends RootStackRouter {
  // ignore: unused_element
  _$RoteadorApp({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    TelaDetalhesFilmeRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<TelaDetalhesFilmeRouteArgs>(
          orElse: () => TelaDetalhesFilmeRouteArgs(
              movieId: pathParams.getInt('movieId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TelaDetalhesFilme(
          args.movieId,
          key: args.key,
        ),
      );
    },
    TelaFavoritosRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TelaFavoritos(),
      );
    },
    TelaGenerosRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TelaGeneros(),
      );
    },
    TelaInicioRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TelaInicio(),
      );
    },
    TelaPrincipalRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TelaPrincipal(),
      );
    },
    TelaVideosRoute.name: (routeData) {
      final args = routeData.argsAs<TelaVideosRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TelaVideos(
          args.movieVideo,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [TelaDetalhesFilme]
class TelaDetalhesFilmeRoute extends PageRouteInfo<TelaDetalhesFilmeRouteArgs> {
  TelaDetalhesFilmeRoute({
    required int movieId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TelaDetalhesFilmeRoute.name,
          args: TelaDetalhesFilmeRouteArgs(
            movieId: movieId,
            key: key,
          ),
          rawPathParams: {'movieId': movieId},
          initialChildren: children,
        );

  static const String name = 'TelaDetalhesFilmeRoute';

  static const PageInfo<TelaDetalhesFilmeRouteArgs> page =
      PageInfo<TelaDetalhesFilmeRouteArgs>(name);
}

class TelaDetalhesFilmeRouteArgs {
  const TelaDetalhesFilmeRouteArgs({
    required this.movieId,
    this.key,
  });

  final int movieId;

  final Key? key;

  @override
  String toString() {
    return 'TelaDetalhesFilmeRouteArgs{movieId: $movieId, key: $key}';
  }
}

/// generated route for
/// [TelaFavoritos]
class TelaFavoritosRoute extends PageRouteInfo<void> {
  const TelaFavoritosRoute({List<PageRouteInfo>? children})
      : super(
          TelaFavoritosRoute.name,
          initialChildren: children,
        );

  static const String name = 'TelaFavoritosRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TelaGeneros]
class TelaGenerosRoute extends PageRouteInfo<void> {
  const TelaGenerosRoute({List<PageRouteInfo>? children})
      : super(
          TelaGenerosRoute.name,
          initialChildren: children,
        );

  static const String name = 'TelaGenerosRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TelaInicio]
class TelaInicioRoute extends PageRouteInfo<void> {
  const TelaInicioRoute({List<PageRouteInfo>? children})
      : super(
          TelaInicioRoute.name,
          initialChildren: children,
        );

  static const String name = 'TelaInicioRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TelaPrincipal]
class TelaPrincipalRoute extends PageRouteInfo<void> {
  const TelaPrincipalRoute({List<PageRouteInfo>? children})
      : super(
          TelaPrincipalRoute.name,
          initialChildren: children,
        );

  static const String name = 'TelaPrincipalRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TelaVideos]
class TelaVideosRoute extends PageRouteInfo<TelaVideosRouteArgs> {
  TelaVideosRoute({
    required VideoFilme movieVideo,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TelaVideosRoute.name,
          args: TelaVideosRouteArgs(
            movieVideo: movieVideo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TelaVideosRoute';

  static const PageInfo<TelaVideosRouteArgs> page =
      PageInfo<TelaVideosRouteArgs>(name);
}

class TelaVideosRouteArgs {
  const TelaVideosRouteArgs({
    required this.movieVideo,
    this.key,
  });

  final VideoFilme movieVideo;

  final Key? key;

  @override
  String toString() {
    return 'TelaVideosRouteArgs{movieVideo: $movieVideo, key: $key}';
  }
}
