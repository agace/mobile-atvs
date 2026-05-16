// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:atv2_navigator_router/models/filme_item.dart' as _i5;
import 'package:atv2_navigator_router/telas/tela_detalhes_filme.dart' as _i1;
import 'package:atv2_navigator_router/telas/tela_inicio.dart' as _i2;
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

/// generated route for
/// [_i1.TelaDetalhesFilme]
class TelaDetalhesFilmeRoute
    extends _i3.PageRouteInfo<TelaDetalhesFilmeRouteArgs> {
  TelaDetalhesFilmeRoute({
    _i4.Key? key,
    required _i5.FilmeItem filme,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         TelaDetalhesFilmeRoute.name,
         args: TelaDetalhesFilmeRouteArgs(key: key, filme: filme),
         initialChildren: children,
       );

  static const String name = 'TelaDetalhesFilmeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TelaDetalhesFilmeRouteArgs>();
      return _i1.TelaDetalhesFilme(key: args.key, filme: args.filme);
    },
  );
}

class TelaDetalhesFilmeRouteArgs {
  const TelaDetalhesFilmeRouteArgs({this.key, required this.filme});

  final _i4.Key? key;

  final _i5.FilmeItem filme;

  @override
  String toString() {
    return 'TelaDetalhesFilmeRouteArgs{key: $key, filme: $filme}';
  }
}

/// generated route for
/// [_i2.TelaInicio]
class TelaInicioRoute extends _i3.PageRouteInfo<void> {
  const TelaInicioRoute({List<_i3.PageRouteInfo>? children})
    : super(TelaInicioRoute.name, initialChildren: children);

  static const String name = 'TelaInicioRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.TelaInicio();
    },
  );
}
