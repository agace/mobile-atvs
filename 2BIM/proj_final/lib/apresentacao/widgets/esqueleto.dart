import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../nucleo/tema/marca.dart';

class EsqueletoGrade extends StatelessWidget {
  const EsqueletoGrade({super.key, this.itens = 6});

  final int itens;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final baseClara = tema.brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: tema.colorScheme.surfaceContainerHighest.withValues(
        alpha: baseClara ? 0.5 : 1,
      ),
      highlightColor: tema.colorScheme.surface,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.66,
        ),
        itemCount: itens,
        itemBuilder: (_, _) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Marca.raio),
          ),
        ),
      ),
    );
  }
}
