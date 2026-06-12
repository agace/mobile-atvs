import 'package:flutter_test/flutter_test.dart';
import 'package:loja/dados/modelos/produto_dto.dart';
import 'package:loja/dados/modelos/resposta_produtos_dto.dart';

void main() {
  group('Conversao de dados (JSON -> DTO -> entidade)', () {
    final json = {
      'id': 7,
      'title': 'Smartphone X',
      'description': 'Top de linha',
      'category': 'smartphones',
      'price': 1999.90,
      'discountPercentage': 12.5,
      'rating': 4.7,
      'stock': 30,
      'brand': 'MarcaX',
      'thumbnail': 'https://exemplo.test/7.png',
      'images': ['https://exemplo.test/7-a.png'],
    };

    test('ProdutoDto.fromJson le todos os campos', () {
      final dto = ProdutoDto.fromJson(json);
      expect(dto.id, 7);
      expect(dto.title, 'Smartphone X');
      expect(dto.price, 1999.90);
      expect(dto.discountPercentage, 12.5);
      expect(dto.images, hasLength(1));
    });

    test('paraEntidade mapeia o DTO para a entidade de dominio em pt-BR', () {
      final produto = ProdutoDto.fromJson(json).paraEntidade();
      expect(produto.titulo, 'Smartphone X');
      expect(produto.categoria, 'smartphones');
      expect(produto.percentualDesconto, 12.5);
      expect(produto.marca, 'MarcaX');
      expect(produto.temDesconto, isTrue);
      expect(produto.disponivel, isTrue);
    });

    test('campos ausentes usam os valores padrao definidos no DTO', () {
      final dto = ProdutoDto.fromJson({'id': 1, 'title': 'Minimo'});
      expect(dto.price, 0);
      expect(dto.images, isEmpty);
      expect(dto.paraEntidade().temDesconto, isFalse);
    });

    test('RespostaProdutosDto desserializa o envelope paginado', () {
      final resposta = RespostaProdutosDto.fromJson({
        'products': [json],
        'total': 100,
        'skip': 0,
        'limit': 20,
      });
      expect(resposta.total, 100);
      expect(resposta.products.single.id, 7);
    });
  });
}
