import 'package:flutter_test/flutter_test.dart';
import 'package:loja/dominio/entidades/item_carrinho.dart';
import 'package:loja/dominio/regras/regras_carrinho.dart';

import '../ajudantes/dados_falsos.dart';

void main() {
  ItemCarrinho item({
    int id = 1,
    double preco = 100,
    double desconto = 0,
    int quantidade = 1,
  }) {
    return ItemCarrinho.doProduto(
      produtoFalso(id: id, preco: preco, percentualDesconto: desconto),
      quantidade: quantidade,
    );
  }

  group('RegrasCarrinho', () {
    test('subtotalItem aplica desconto e multiplica pela quantidade', () {
      expect(RegrasCarrinho.subtotalItem(item(preco: 50, quantidade: 3)), 150);
      expect(
        RegrasCarrinho.subtotalItem(
          item(preco: 100, desconto: 10, quantidade: 2),
        ),
        180,
      );
    });

    test('total soma o subtotal de todos os itens', () {
      final itens = [
        item(id: 1, preco: 100, quantidade: 2),
        item(id: 2, preco: 50, desconto: 50, quantidade: 1),
      ];
      expect(RegrasCarrinho.total(itens), 225);
    });

    test('quantidadeTotal soma as unidades', () {
      final itens = [item(id: 1, quantidade: 2), item(id: 2, quantidade: 3)];
      expect(RegrasCarrinho.quantidadeTotal(itens), 5);
    });

    test('economiaTotal reflete o valor poupado com descontos', () {
      final itens = [item(preco: 100, desconto: 20, quantidade: 2)];

      expect(RegrasCarrinho.economiaTotal(itens), 40);
    });

    test('total de carrinho vazio e zero', () {
      expect(RegrasCarrinho.total(const []), 0);
    });

    test('frete e cobrado abaixo do limite e gratis a partir dele', () {
      expect(RegrasCarrinho.frete(150), RegrasCarrinho.valorFrete);
      expect(RegrasCarrinho.frete(RegrasCarrinho.limiteFreteGratis), 0);
      expect(RegrasCarrinho.frete(250), 0);
      expect(RegrasCarrinho.frete(0), 0);
    });

    test('faltaParaFreteGratis informa o quanto falta atingir o limite', () {
      expect(RegrasCarrinho.faltaParaFreteGratis(150), 49);
      expect(RegrasCarrinho.faltaParaFreteGratis(200), 0);
      expect(RegrasCarrinho.faltaParaFreteGratis(0), 0);
    });

    test('totalAPagar soma subtotal e frete', () {
      final itens = [item(preco: 50, quantidade: 1)];
      expect(RegrasCarrinho.totalAPagar(itens), 50 + RegrasCarrinho.valorFrete);

      final acimaLimite = [item(preco: 100, quantidade: 3)];
      expect(RegrasCarrinho.totalAPagar(acimaLimite), 300);
    });
  });
}
