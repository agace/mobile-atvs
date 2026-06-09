import 'produto.dart';

class ItemCarrinho {
  const ItemCarrinho({
    required this.produtoId,
    required this.titulo,
    required this.miniatura,
    required this.precoUnitario,
    required this.percentualDesconto,
    required this.quantidade,
  });

  final int produtoId;
  final String titulo;
  final String miniatura;
  final double precoUnitario;
  final double percentualDesconto;
  final int quantidade;

  factory ItemCarrinho.doProduto(Produto produto, {int quantidade = 1}) {
    return ItemCarrinho(
      produtoId: produto.id,
      titulo: produto.titulo,
      miniatura: produto.miniatura,
      precoUnitario: produto.preco,
      percentualDesconto: produto.percentualDesconto,
      quantidade: quantidade,
    );
  }

  ItemCarrinho copiarCom({int? quantidade}) {
    return ItemCarrinho(
      produtoId: produtoId,
      titulo: titulo,
      miniatura: miniatura,
      precoUnitario: precoUnitario,
      percentualDesconto: percentualDesconto,
      quantidade: quantidade ?? this.quantidade,
    );
  }
}
