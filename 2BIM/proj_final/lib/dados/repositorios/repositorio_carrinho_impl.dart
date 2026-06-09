import 'package:drift/drift.dart';

import '../../dominio/entidades/item_carrinho.dart';
import '../../dominio/entidades/produto.dart';
import '../../dominio/repositorios/repositorio_carrinho.dart';
import '../fontes/banco_local.dart';

class RepositorioCarrinhoImpl implements RepositorioCarrinho {
  RepositorioCarrinhoImpl(this._banco);

  final BancoLocal _banco;

  ItemCarrinho _paraEntidade(ItensCarrinhoData linha) {
    return ItemCarrinho(
      produtoId: linha.produtoId,
      titulo: linha.titulo,
      miniatura: linha.miniatura,
      precoUnitario: linha.precoUnitario,
      percentualDesconto: linha.percentualDesconto,
      quantidade: linha.quantidade,
    );
  }

  @override
  Future<List<ItemCarrinho>> listarItens() async {
    final linhas = await _banco.select(_banco.itensCarrinho).get();
    return linhas.map(_paraEntidade).toList();
  }

  @override
  Stream<List<ItemCarrinho>> observarItens() {
    return _banco
        .select(_banco.itensCarrinho)
        .watch()
        .map((linhas) => linhas.map(_paraEntidade).toList());
  }

  @override
  Future<void> adicionar(Produto produto) async {
    final existente = await (_banco.select(
      _banco.itensCarrinho,
    )..where((t) => t.produtoId.equals(produto.id))).getSingleOrNull();

    if (existente == null) {
      await _banco
          .into(_banco.itensCarrinho)
          .insert(
            ItensCarrinhoCompanion.insert(
              produtoId: Value(produto.id),
              titulo: produto.titulo,
              miniatura: produto.miniatura,
              precoUnitario: produto.preco,
              percentualDesconto: Value(produto.percentualDesconto),
            ),
          );
    } else {
      await definirQuantidade(produto.id, existente.quantidade + 1);
    }
  }

  @override
  Future<void> definirQuantidade(int produtoId, int quantidade) async {
    if (quantidade <= 0) {
      await remover(produtoId);
      return;
    }
    await (_banco.update(_banco.itensCarrinho)
          ..where((t) => t.produtoId.equals(produtoId)))
        .write(ItensCarrinhoCompanion(quantidade: Value(quantidade)));
  }

  @override
  Future<void> remover(int produtoId) async {
    await (_banco.delete(
      _banco.itensCarrinho,
    )..where((t) => t.produtoId.equals(produtoId))).go();
  }

  @override
  Future<void> limpar() async {
    await _banco.delete(_banco.itensCarrinho).go();
  }
}
