import 'package:flutter/material.dart';

import 'package:filmes/ui/tema/tema.dart';

class DivisorSliver extends StatelessWidget {
  const DivisorSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverPadding(
      padding: EdgeInsets.only(
          left: 16, top: 8, right: 16, bottom: 8),
      sliver: SliverToBoxAdapter(
        child: Divider(
          color: botaoPrimario,
          thickness: 1.0,
        ),
      ),
    );
  }
}