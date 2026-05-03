import 'package:flutter/material.dart';

import '../models/filme_item.dart';

class FilmesListView extends StatelessWidget {
  const FilmesListView({super.key, required this.filmes, this.onFilmeTap});

  final List<FilmeItem> filmes;
  final ValueChanged<FilmeItem>? onFilmeTap;

  @override
  Widget build(BuildContext context) {
    // Desafio 1: ListView.builder constrói os itens sob demanda (lazy),
    // mantendo o app fluido mesmo com listas muito grandes.
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      itemCount: filmes.length,
      itemBuilder: (BuildContext context, int index) {
        final FilmeItem filme = filmes[index];
        return Center(
          child: Container(
            width: 220,
            margin: const EdgeInsets.only(bottom: 16),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black12),
            ),
            // Desafio 2: Material + InkWell aplicam ripple ao toque.
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onFilmeTap == null ? null : () => onFilmeTap!(filme),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 27 / 40,
                      child: Image.network(
                        filme.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (
                              BuildContext context,
                              Object error,
                              StackTrace? stackTrace,
                            ) {
                              return Container(
                                color: const Color(0xFFB0BEC5),
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.broken_image_rounded,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              );
                            },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        filme.titulo,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
