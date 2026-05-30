import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:filmes/dados/banco/banco_dados.dart';
import 'package:filmes/utilitarios/utilitarios.dart';
import 'package:filmes/ui/viewmodel_filmes.dart';

class LinhaFavorito extends StatelessWidget {
  final Favorito favorite;
  final ViewModelFilmes viewModelFilmes;
  final OnMovieTap onMovieTap;
  final OnFavoriteResultsTap onFavoritesTap;

  const LinhaFavorito(
      {super.key,
      required this.favorite,
      required this.viewModelFilmes,
      required this.onMovieTap, required this.onFavoritesTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textWidth = screenWidth - 132;
    final imageUrl = favorite.image;
    if (imageUrl.isNotEmpty) {
      return GestureDetector(
        onTap: () => onMovieTap(favorite.movieId),
        child: SizedBox(
          height: 148,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              addHorizontalSpace(16),
              SizedBox(
                height: 140,
                width: 100,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  height: 140,
                  width: 100,
                ),
              ),
              addHorizontalSpace(16),
              Stack(
                children: [
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      onPressed: () => onFavoritesTap(favorite),
                      icon: favorite.favorite ? const Icon(
                        Icons.favorite_outlined,
                        color: Colors.red,
                      ) : const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: textWidth,
                              child: AutoSizeText(
                                favorite.title,
                                maxLines: 1,
                                minFontSize: 10,
                                style: Theme.of(context).textTheme.labelLarge,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            addVerticalSpace( 4),
                            Text(
                              yearFormat.format(favorite.releaseDate),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            addVerticalSpace( 4),
                          ],
                        ),
                      ]),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
