import 'package:flutter/material.dart';
import 'package:filmes/dados/modelos/detalhes_filme.dart';

import 'package:filmes/ui/tema/tema.dart';

class SinopseFilme extends StatelessWidget {
  final DetalhesFilme details;

  const SinopseFilme({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Text(
        details.overview,
        style: body1Regular.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}
