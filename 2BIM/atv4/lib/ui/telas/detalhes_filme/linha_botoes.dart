import 'package:flutter/material.dart';

import 'package:filmes/utilitarios/utilitarios.dart';
import 'package:filmes/ui/widgets/icone_texto.dart';

typedef OnFavoriteSelected = void Function();

class LinhaBotoes extends StatefulWidget {
  final bool favoriteSelected;
  final OnFavoriteSelected onFavoriteSelected;

  const LinhaBotoes({
    super.key,
    required this.favoriteSelected,
    required this.onFavoriteSelected,
  });

  @override
  State<LinhaBotoes> createState() => _ButtonRowState();
}

class _ButtonRowState extends State<LinhaBotoes> with TickerProviderStateMixin {
  late AnimationController _sizeController;
  late Animation<double> _sizeAnimation;

  late AnimationController _colorController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _sizeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _sizeAnimation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(
      CurvedAnimation(parent: _sizeController, curve: Curves.easeInOut),
    );

    _colorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.red,
    ).animate(
      CurvedAnimation(parent: _colorController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _sizeController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 0, bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconeTexto(
            text: Text(
              'Favorito',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            icon: IconButton(
              onPressed: () {
                widget.onFavoriteSelected();
              },
              icon: widget.favoriteSelected
                  ? AnimatedBuilder(
                      animation:
                          Listenable.merge([_sizeController, _colorController]),
                      builder: (context, child) {
                        return Icon(
                          Icons.favorite_outlined,
                          size: 21 * _sizeAnimation.value,
                          color: _colorAnimation.value,
                        );
                      })
                  : Icon(
                      Icons.favorite_border,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
            ),
          ),
          addHorizontalSpace(32),
          IconeTexto(
            text: Text(
              'Rate',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            icon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.thumb_up_alt_outlined,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          addHorizontalSpace(32),
          IconeTexto(
            text: Text(
              'Share',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            icon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.ios_share,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
