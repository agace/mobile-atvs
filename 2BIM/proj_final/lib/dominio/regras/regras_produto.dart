import '../entidades/produto.dart';

enum CriterioOrdenacao { relevancia, menorPreco, maiorPreco, melhorAvaliacao }

class RegrasProduto {
  RegrasProduto._();

  static double aplicarDesconto(double preco, double percentualDesconto) {
    if (percentualDesconto < 0 || percentualDesconto > 100) {
      throw ArgumentError('Percentual de desconto deve estar entre 0 e 100.');
    }
    final valorComDesconto = preco * (1 - percentualDesconto / 100);

    return (valorComDesconto * 100).roundToDouble() / 100;
  }

  static double precoComDesconto(Produto produto) {
    return aplicarDesconto(produto.preco, produto.percentualDesconto);
  }

  static List<Produto> ordenar(
    List<Produto> produtos,
    CriterioOrdenacao criterio,
  ) {
    final copia = List<Produto>.from(produtos);
    switch (criterio) {
      case CriterioOrdenacao.menorPreco:
        copia.sort(
          (a, b) => precoComDesconto(a).compareTo(precoComDesconto(b)),
        );
      case CriterioOrdenacao.maiorPreco:
        copia.sort(
          (a, b) => precoComDesconto(b).compareTo(precoComDesconto(a)),
        );
      case CriterioOrdenacao.melhorAvaliacao:
        copia.sort((a, b) => b.avaliacao.compareTo(a.avaliacao));
      case CriterioOrdenacao.relevancia:
        break;
    }
    return copia;
  }

  static List<Produto> filtrarPorTexto(List<Produto> produtos, String termo) {
    final alvo = termo.trim().toLowerCase();
    if (alvo.isEmpty) return List<Produto>.from(produtos);
    return produtos.where((p) {
      return p.titulo.toLowerCase().contains(alvo) ||
          p.marca.toLowerCase().contains(alvo);
    }).toList();
  }
}
