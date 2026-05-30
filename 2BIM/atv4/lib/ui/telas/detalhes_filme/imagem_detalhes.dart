import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:filmes/dados/modelos/detalhes_filme.dart';

import 'package:filmes/provedores.dart';
import 'package:filmes/utilitarios/utilitarios.dart';

class ImagemDetalhes extends ConsumerStatefulWidget {
  final DetalhesFilme details;
  const ImagemDetalhes({required this.details, super.key});

  @override
  ConsumerState<ImagemDetalhes> createState() => _DetailImageState();
}

class _DetailImageState extends ConsumerState<ImagemDetalhes> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heroTag = ref.read(tagHeroProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final imageUrl = getImageUrl(ImageSize.large, widget.details.backdropPath);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: SizedBox(
        height: 200,
        child: Stack(children: [
          Align(
            alignment: Alignment.topCenter,
            child: FadeTransition(
              opacity: _animation,
              child: Hero(
                tag: heroTag,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                  height: 200,
                  width: screenWidth,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, bottom: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.details.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  addVerticalSpace(4),
                  Text(
                    yearFormat.format(widget.details.releaseDate),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
