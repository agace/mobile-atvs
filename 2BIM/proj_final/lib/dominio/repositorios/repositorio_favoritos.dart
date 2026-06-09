import '../entidades/produto.dart';

abstract interface class RepositorioFavoritos {
  Future<List<Produto>> listar();

  Future<bool> ehFavorito(int produtoId);

  Future<bool> alternar(Produto produto);

  Stream<List<Produto>> observar();
}
