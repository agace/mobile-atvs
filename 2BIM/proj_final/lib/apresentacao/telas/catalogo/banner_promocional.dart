import 'package:flutter/material.dart';

import '../../../nucleo/i18n/textos.dart';
import '../../../nucleo/tema/marca.dart';

class _Promo {
  const _Promo({
    required this.texto,
    required this.icone,
    required this.tintaNoFundo,
  });

  final TextoPromo texto;
  final IconData icone;

  final bool tintaNoFundo;
}

class BannerPromocional extends StatefulWidget {
  const BannerPromocional({super.key});

  @override
  State<BannerPromocional> createState() => _BannerPromocionalState();
}

class _BannerPromocionalState extends State<BannerPromocional> {
  final _controle = PageController(viewportFraction: 0.9);
  int _atual = 0;

  static const _estilos = [
    (icone: Icons.bolt_rounded, tintaNoFundo: true),
    (icone: Icons.local_shipping_outlined, tintaNoFundo: false),
    (icone: Icons.auto_awesome_outlined, tintaNoFundo: true),
  ];

  @override
  void dispose() {
    _controle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final textosPromo = Textos.of(context).promos;
    final promos = [
      for (var i = 0; i < _estilos.length && i < textosPromo.length; i++)
        _Promo(
          texto: textosPromo[i],
          icone: _estilos[i].icone,
          tintaNoFundo: _estilos[i].tintaNoFundo,
        ),
    ];

    return Column(
      children: [
        SizedBox(
          height: 156,
          child: PageView.builder(
            controller: _controle,
            onPageChanged: (i) => setState(() => _atual = i),
            itemCount: promos.length,
            itemBuilder: (_, i) => _CartaoPromo(promo: promos[i]),
          ),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < promos.length; i++)
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: _atual == i ? 22 : 7,
                height: 7,
                decoration: BoxDecoration(
                  color: _atual == i
                      ? tema.colorScheme.onSurface
                      : tema.colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _CartaoPromo extends StatelessWidget {
  const _CartaoPromo({required this.promo});

  final _Promo promo;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final fundo = promo.tintaNoFundo ? Marca.tinta : Marca.acento;
    final sobre = promo.tintaNoFundo ? Colors.white : Marca.tinta;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: fundo,
        borderRadius: BorderRadius.circular(Marca.raioGrande),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  promo.texto.etiqueta,
                  style: tema.textTheme.labelSmall?.copyWith(
                    color: sobre.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.4,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  promo.texto.titulo,
                  style: tema.textTheme.headlineSmall?.copyWith(
                    color: sobre,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  promo.texto.subtitulo,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: tema.textTheme.bodySmall?.copyWith(
                    color: sobre.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Icon(promo.icone, color: sobre.withValues(alpha: 0.9), size: 56),
        ],
      ),
    );
  }
}
