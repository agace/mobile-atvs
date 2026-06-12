import 'package:loja/dominio/entidades/categoria.dart';
import 'package:loja/dominio/entidades/produto.dart';
import 'package:loja/dominio/repositorios/repositorio_produtos.dart';

Produto produtoFalso({
  int id = 1,
  String titulo = 'Produto Teste',
  double preco = 100,
  double percentualDesconto = 0,
  double avaliacao = 4.5,
  int estoque = 10,
  String marca = 'Marca',
  String categoria = 'geral',
}) {
  return Produto(
    id: id,
    titulo: titulo,
    descricao: 'Descricao do produto $id',
    categoria: categoria,
    preco: preco,
    percentualDesconto: percentualDesconto,
    avaliacao: avaliacao,
    estoque: estoque,
    marca: marca,
    miniatura: 'https://exemplo.test/$id.png',
    imagens: const [],
  );
}

class RepositorioProdutosFalso implements RepositorioProdutos {
  RepositorioProdutosFalso(this.produtos);

  final List<Produto> produtos;

  @override
  Future<List<Produto>> listarProdutos({int pagina = 0}) async => produtos;

  @override
  Future<List<Produto>> buscarProdutos(String termo) async {
    return produtos
        .where((p) => p.titulo.toLowerCase().contains(termo.toLowerCase()))
        .toList();
  }

  @override
  Future<List<Produto>> listarPorCategoria(String slug) async {
    return produtos.where((p) => p.categoria == slug).toList();
  }

  @override
  Future<Produto> detalhe(int id) async {
    return produtos.firstWhere((p) => p.id == id);
  }

  @override
  Future<List<Categoria>> listarCategorias() async {
    return const [
      Categoria(slug: 'geral', nome: 'Geral'),
      Categoria(slug: 'eletronicos', nome: 'Eletronicos'),
    ];
  }
}
