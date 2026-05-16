
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmes/provedores.dart';

import 'package:filmes/utilitarios/utilitarios.dart';

enum MovieType {
  trending,
  popular,
  topRated,
  nowPlaying
}

class WidgetFilme extends ConsumerStatefulWidget {
  final int movieId;
  final String urlFilme;
  final OnMovieTap onMovieTap;
  final MovieType movieType;

  const WidgetFilme(
      {required this.movieId,
        required this.urlFilme,
        required this.onMovieTap,
        required this.movieType,
        super.key});

  @override
  ConsumerState<WidgetFilme> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends ConsumerState<WidgetFilme>
    with SingleTickerProviderStateMixin {
  bool animateImage = false;
  late String uniqueHeroTag;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    uniqueHeroTag = widget.urlFilme + widget.movieType.name;
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          ref.read(tagHeroProvider.notifier).state = uniqueHeroTag;
          animateImage = true;
          _controller.forward();
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 100,
          height: 142,
          child: Hero(
            tag: uniqueHeroTag,
            child: CachedNetworkImage(
              imageUrl: widget.urlFilme,
              alignment: Alignment.topCenter,
              fit: BoxFit.fitHeight,
              height: 100,
              width: 142,
            )
                .animate(
                    autoPlay: false,
                    controller: _controller,
                    onComplete: (controller) {
                      if (animateImage) {
                        animateImage = false;
                        widget.onMovieTap(widget.movieId);
                      }
                    })
                .scaleXY(begin: 1.0, end: 1.1, duration: 600.ms)
                .then(delay: 600.ms)
                .scaleXY(begin: 1.1, end: 1.0, duration: 600.ms),
          ),
        ),
      ),
    );
  }
}
