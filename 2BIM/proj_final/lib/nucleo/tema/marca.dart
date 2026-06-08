import 'package:flutter/material.dart';

class Marca {
  Marca._();

  static const String nome = 'ecremm';
  static const String assinatura = 'commerce, ao contrario';

  static const Color tinta = Color(0xFF111114);
  static const Color tintaSuave = Color(0xFF6B6B72);

  static const Color acento = Color(0xFFCBFB45);

  static const Color acentoTinta = Color(0xFF5C7A00);

  static const Color fundoClaro = Color(0xFFF5F5F1);
  static const Color superficieClara = Color(0xFFFFFFFF);
  static const Color contornoClaro = Color(0xFFE7E7E1);

  static const Color fundoEscuro = Color(0xFF0B0B0C);
  static const Color superficieEscura = Color(0xFF161618);
  static const Color contornoEscuro = Color(0xFF2A2A2D);

  static const Color positivo = Color(0xFF1F9D55);
  static const Color alerta = Color(0xFFE5484D);

  static const double raio = 16;
  static const double raioGrande = 26;
  static const double espaco = 16;

  static List<BoxShadow> sombra(Color base) => [
    BoxShadow(
      color: base.withValues(alpha: 0.05),
      blurRadius: 24,
      offset: const Offset(0, 10),
    ),
  ];
}
