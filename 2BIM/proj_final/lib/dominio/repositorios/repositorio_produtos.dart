import '../entidades/categoria.dart';
import '../entidades/produto.dart';

abstract interface class RepositorioProdutos {
  Future<List<Produto>> listarProdutos({int pagina = 0});

  Future<List<Produto>> buscarProdutos(String termo);

  Future<List<Produto>> listarPorCategoria(String slug);

  Future<Produto> detalhe(int id);

  Future<List<Categoria>> listarCategorias();
}
