import 'package:flutter/material.dart';

typedef OnMoreClicked = void Function();

class LinhaTitulo extends StatelessWidget {
  final String text;
  final OnMoreClicked onMoreClicked;
  const LinhaTitulo({super.key, required this.text, required this.onMoreClicked});

  @override
  Widget build(BuildContext context) {
    final corTexto = Theme.of(context).colorScheme.onSurface;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16.0, 0.0, 8.0),
          child: Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: corTexto)),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16.0, 8.0, 0.0),
          child: TextButton(
            onPressed: onMoreClicked,
            child: Text(
              'More',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: corTexto),
            ),
          ),
        ),
      ],
    );
  }
}
