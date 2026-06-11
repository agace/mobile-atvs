import 'package:flutter/material.dart';

import '../../nucleo/tema/marca.dart';

class LogoMarca extends StatelessWidget {
  const LogoMarca({
    super.key,
    this.tamanho = 24,
    this.mostrarNome = true,
    this.cor,
  });

  final double tamanho;
  final bool mostrarNome;

  final Color? cor;

  @override
  Widget build(BuildContext context) {
    if (!mostrarNome) return _Selo(lado: tamanho);

    final tinta = cor ?? Theme.of(context).colorScheme.onSurface;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: Marca.nome),
          TextSpan(
            text: '.',
            style: TextStyle(color: Marca.acentoTinta),
          ),
        ],
        style: TextStyle(
          color: tinta,
          fontSize: tamanho,
          fontWeight: FontWeight.w800,
          letterSpacing: -1,
          height: 1,
        ),
      ),
    );
  }
}

class _Selo extends StatelessWidget {
  const _Selo({required this.lado});

  final double lado;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: lado,
      height: lado,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Marca.tinta,
        borderRadius: BorderRadius.circular(lado * 0.28),
      ),
      child: Text(
        'e',
        style: TextStyle(
          color: Marca.acento,
          fontSize: lado * 0.6,
          fontWeight: FontWeight.w800,
          letterSpacing: -1,
          height: 1,
        ),
      ),
    );
  }
}
