import 'package:drift/drift.dart';

import '../../dominio/entidades/produto.dart';
import '../../dominio/repositorios/repositorio_favoritos.dart';
import '../fontes/banco_local.dart';

class RepositorioFavoritosImpl implements RepositorioFavoritos {
  RepositorioFavoritosImpl(this._banco);

  final BancoLocal _banco;

  Produto _paraEntidade(Favorito linha) {
    return Produto(
      id: linha.produtoId,
      titulo: linha.titulo,
      descricao: linha.descricao,
      categoria: linha.categoria,
      preco: linha.preco,
      percentualDesconto: linha.percentualDesconto,
      avaliacao: linha.avaliacao,
      estoque: linha.estoque,
      marca: linha.marca,
      miniatura: linha.miniatura,
      imagens: const [],
    );
  }

  @override
  Future<List<Produto>> listar() async {
    final linhas = await _banco.select(_banco.favoritos).get();
    return linhas.map(_paraEntidade).toList();
  }

  @override
  Stream<List<Produto>> observar() {
    return _banco
        .select(_banco.favoritos)
        .watch()
        .map((linhas) => linhas.map(_paraEntidade).toList());
  }

  @override
  Future<bool> ehFavorito(int produtoId) async {
    final linha = await (_banco.select(
      _banco.favoritos,
    )..where((t) => t.produtoId.equals(produtoId))).getSingleOrNull();
    return linha != null;
  }

  @override
  Future<bool> alternar(Produto produto) async {
    if (await ehFavorito(produto.id)) {
      await (_banco.delete(
        _banco.favoritos,
      )..where((t) => t.produtoId.equals(produto.id))).go();
      return false;
    }
    await _banco
        .into(_banco.favoritos)
        .insert(
          FavoritosCompanion.insert(
            produtoId: Value(produto.id),
            titulo: produto.titulo,
            descricao: Value(produto.descricao),
            categoria: Value(produto.categoria),
            preco: Value(produto.preco),
            percentualDesconto: Value(produto.percentualDesconto),
            avaliacao: Value(produto.avaliacao),
            estoque: Value(produto.estoque),
            marca: Value(produto.marca),
            miniatura: Value(produto.miniatura),
          ),
        );
    return true;
  }
}
