import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../dominio/entidades/produto.dart';
import '../../dominio/regras/regras_produto.dart';
import '../../nucleo/formatador.dart';
import '../../nucleo/i18n/textos.dart';
import '../../nucleo/tema/marca.dart';

class CartaoProduto extends StatelessWidget {
  const CartaoProduto({
    super.key,
    required this.produto,
    required this.aoTocar,
    this.ehFavorito = false,
    this.aoFavoritar,
  });

  final Produto produto;
  final VoidCallback aoTocar;
  final bool ehFavorito;
  final VoidCallback? aoFavoritar;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final precoFinal = RegrasProduto.precoComDesconto(produto);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: tema.colorScheme.surface,
        borderRadius: BorderRadius.circular(Marca.raio),
        border: Border.all(color: tema.colorScheme.outlineVariant),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Marca.raio),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: aoTocar,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _Imagem(
                    produto: produto,
                    ehFavorito: ehFavorito,
                    aoFavoritar: aoFavoritar,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (produto.marca.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: Text(
                            produto.marca.toUpperCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: tema.textTheme.labelSmall?.copyWith(
                              color: tema.colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.8,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      Text(
                        produto.titulo,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: tema.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              Formatador.moeda(precoFinal),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: tema.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ),
                          if (produto.temDesconto) ...[
                            const SizedBox(width: 6),
                            Text(
                              Formatador.moeda(produto.preco),
                              style: tema.textTheme.labelSmall?.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: tema.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Imagem extends StatelessWidget {
  const _Imagem({
    required this.produto,
    required this.ehFavorito,
    required this.aoFavoritar,
  });

  final Produto produto;
  final bool ehFavorito;
  final VoidCallback? aoFavoritar;

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        ColoredBox(
          color: tema.colorScheme.surfaceContainerHighest,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: CachedNetworkImage(
              imageUrl: produto.miniatura,
              fit: BoxFit.contain,
              placeholder: (_, _) => const SizedBox.shrink(),
              errorWidget: (_, _, _) => Icon(
                Icons.image_outlined,
                size: 40,
                color: tema.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
        if (produto.temDesconto)
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Marca.acento,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '-${produto.percentualDesconto.round()}%',
                style: tema.textTheme.labelSmall?.copyWith(
                  color: Marca.tinta,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        if (aoFavoritar != null)
          Positioned(
            top: 6,
            right: 6,
            child: Material(
              color: tema.colorScheme.surface.withValues(alpha: 0.9),
              shape: const CircleBorder(),
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: aoFavoritar,
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: Icon(
                    ehFavorito ? Icons.favorite : Icons.favorite_border,
                    size: 18,
                    color: ehFavorito
                        ? Marca.alerta
                        : tema.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ),
        if (!produto.disponivel)
          Positioned.fill(
            child: ColoredBox(
              color: tema.colorScheme.surface.withValues(alpha: 0.6),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Marca.tinta,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    Textos.of(context).esgotado,
                    style: tema.textTheme.labelMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
