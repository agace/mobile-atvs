import '../entidades/item_carrinho.dart';
import '../entidades/produto.dart';

abstract interface class RepositorioCarrinho {
  Future<List<ItemCarrinho>> listarItens();

  Future<void> adicionar(Produto produto);

  Future<void> definirQuantidade(int produtoId, int quantidade);

  Future<void> remover(int produtoId);

  Future<void> limpar();

  Stream<List<ItemCarrinho>> observarItens();
}
