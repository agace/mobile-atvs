import 'package:flutter_test/flutter_test.dart';
import 'package:loja/dominio/regras/regras_produto.dart';

import '../ajudantes/dados_falsos.dart';

void main() {
  group('RegrasProduto.aplicarDesconto', () {
    test('aplica o percentual e arredonda em centavos', () {
      expect(RegrasProduto.aplicarDesconto(100, 10), 90);
      expect(RegrasProduto.aplicarDesconto(199.99, 25), 149.99);
    });

    test('retorna o preco cheio quando nao ha desconto', () {
      expect(RegrasProduto.aplicarDesconto(59.90, 0), 59.90);
    });

    test('lanca ArgumentError para percentual fora de 0-100', () {
      expect(() => RegrasProduto.aplicarDesconto(100, -1), throwsArgumentError);
      expect(
        () => RegrasProduto.aplicarDesconto(100, 150),
        throwsArgumentError,
      );
    });
  });

  group('RegrasProduto.ordenar', () {
    final produtos = [
      produtoFalso(id: 1, preco: 300, avaliacao: 3.0),
      produtoFalso(id: 2, preco: 100, avaliacao: 5.0),
      produtoFalso(id: 3, preco: 200, avaliacao: 4.0),
    ];

    test('ordena por menor preco sem alterar a lista original', () {
      final ordenado = RegrasProduto.ordenar(
        produtos,
        CriterioOrdenacao.menorPreco,
      );
      expect(ordenado.map((p) => p.id), [2, 3, 1]);

      expect(produtos.map((p) => p.id), [1, 2, 3]);
    });

    test('ordena por melhor avaliacao', () {
      final ordenado = RegrasProduto.ordenar(
        produtos,
        CriterioOrdenacao.melhorAvaliacao,
      );
      expect(ordenado.map((p) => p.id), [2, 3, 1]);
    });
  });

  group('RegrasProduto.filtrarPorTexto', () {
    final produtos = [
      produtoFalso(id: 1, titulo: 'Notebook Gamer', marca: 'Acer'),
      produtoFalso(id: 2, titulo: 'Mouse sem fio', marca: 'Logitech'),
      produtoFalso(id: 3, titulo: 'Teclado', marca: 'Logitech'),
    ];

    test('filtra por titulo ou marca ignorando maiusculas', () {
      expect(RegrasProduto.filtrarPorTexto(produtos, 'logitech').length, 2);
      expect(RegrasProduto.filtrarPorTexto(produtos, 'note').single.id, 1);
    });

    test('retorna todos quando o termo esta vazio', () {
      expect(RegrasProduto.filtrarPorTexto(produtos, '   ').length, 3);
    });
  });
}
