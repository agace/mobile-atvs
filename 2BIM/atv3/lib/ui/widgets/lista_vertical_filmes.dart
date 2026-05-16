import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:filmes/dados/modelos/filme.dart';
import 'package:filmes/ui/widgets/linha_filme.dart';

typedef OnMovieTap = void Function(int movieId);

class VerticalMovieList extends ConsumerWidget {
  final List<Filme> movies;
  final OnMovieTap onMovieTap;

  const VerticalMovieList({
    super.key,
    required this.movies,
    required this.onMovieTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: movies.length,
        (BuildContext context, int index) {
          return LinhaFilme(
            movie: movies[index], onMovieTap: onMovieTap,
          );
        },
      ),
    );
  }
}
