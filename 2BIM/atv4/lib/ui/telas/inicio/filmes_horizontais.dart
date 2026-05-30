import 'package:flutter/material.dart';

import 'package:filmes/dados/modelos/resultado_filme.dart';
import 'package:filmes/utilitarios/utilitarios.dart';
import 'package:filmes/ui/widgets/widget_filme.dart';

class HorizontalMovies extends StatelessWidget {
  final MovieType movieType;
  final OnMovieTap onMovieTap;
  final List<ResultadoFilme> movies;

  const HorizontalMovies(
      {required this.onMovieTap,
      required this.movies,
      required this.movieType,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 142,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final imageUrl = getImageUrl(ImageSize.small, movies[index].posterPath);
            return WidgetFilme(
              movieId: movies[index].id,
              urlFilme: imageUrl,
              onMovieTap: onMovieTap,
              movieType: movieType,
            );
          }),
    );
  }
}
