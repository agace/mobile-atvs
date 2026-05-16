import 'package:flutter/material.dart';

import 'package:filmes/dados/modelos/favorito.dart';
import 'package:filmes/utilitarios/utilitarios.dart';
import 'package:filmes/ui/viewmodel_filmes.dart';
import 'package:filmes/ui/widgets/linha_favorito.dart';

class VerticalFavoriteList extends StatelessWidget {
  final List<Favorito> favorites;
  final ViewModelFilmes viewModelFilmes;
  final OnMovieTap onMovieTap;
  final OnFavoriteResultsTap onFavoritesTap;

  const VerticalFavoriteList(
      {super.key,
      required this.favorites,
      required this.viewModelFilmes,
      required this.onMovieTap,
        required this.onFavoritesTap,
      });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return LinhaFavorito(
            favorite: favorites[index],
            viewModelFilmes: viewModelFilmes,
            onMovieTap: (id) {
              onMovieTap(id);
            },
            onFavoritesTap: (favorite) {
              onFavoritesTap(favorite);
            },
          );
        },
        childCount: favorites.length,
      ),
    );
  }
}
