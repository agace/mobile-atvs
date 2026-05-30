import 'package:flutter/material.dart';

import 'package:filmes/utilitarios/utilitarios.dart';

class IconeTexto extends StatelessWidget {
  final Text text;
  final IconButton icon;
  const IconeTexto({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        addVerticalSpace(4),
        text,
      ],
    )
    ;
  }
}
