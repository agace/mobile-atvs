import 'package:flutter/material.dart';
import 'package:filmes/dados/modelos/genero.dart';

import 'package:filmes/ui/tema/tema.dart';

class LinhaGeneros extends StatefulWidget {
  final List<Genero> genres;

  const LinhaGeneros({super.key, required this.genres});

  @override
  State<LinhaGeneros> createState() => _GenreRowState();
}

class _GenreRowState extends State<LinhaGeneros>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 24, bottom: 16),
      child: SizedBox(
        height: 34,
        child: SlideTransition(
          position: _offsetAnimation,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: widget.genres
                .map((genre) => Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: cinzaBotao,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        genre.name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
