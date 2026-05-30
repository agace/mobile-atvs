import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:filmes/provedores.dart';
import 'package:filmes/utilitarios/utilitarios.dart';
import 'package:filmes/ui/viewmodel_filmes.dart';

const delayTime = 1000 * 10;
const animationTime = 1000;

class ImagemTelaInicio extends ConsumerWidget {
  final ViewModelFilmes viewModelFilmes;
  final OnMovieTap onMovieTap;

  const ImagemTelaInicio(
      {required this.viewModelFilmes, required this.onMovieTap, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width - 32;
    return SizedBox(
      height: 374,
      child: Swiper(
        autoplayDelay: delayTime,
        duration: animationTime,
        itemWidth: screenWidth,
        autoplay: true,
        itemCount: viewModelFilmes.filmesEmCartaz.length,
        itemBuilder: (BuildContext context, int index) {
          final currentMovie = viewModelFilmes.filmesEmCartaz[index];
          final imageUrl =
              getImageUrl(ImageSize.large, currentMovie.backdropPath);
          String uniqueHeroTag = '${currentMovie.posterPath}swiper';
          return GestureDetector(
            onTap: () {
              ref.read(tagHeroProvider.notifier).state = uniqueHeroTag;
              onMovieTap(currentMovie.id);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: uniqueHeroTag,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fitHeight,
                      height: 374,
                      width: screenWidth,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModelFilmes.filmesEmCartaz[index].title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        addVerticalSpace(4),
                        currentMovie.releaseDate != null
                            ? Text(
                                yearFormat.format(currentMovie.releaseDate!),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.white),
                              )
                            : Container(),
                        addVerticalSpace(4),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, right: 8.0),
                          child: AutoSizeText(
                            viewModelFilmes.filmesEmCartaz[index].overview,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.white),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
