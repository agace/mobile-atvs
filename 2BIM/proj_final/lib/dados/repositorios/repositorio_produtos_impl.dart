import '../../dominio/entidades/categoria.dart';
import '../../dominio/entidades/produto.dart';
import '../../dominio/repositorios/repositorio_produtos.dart';
import '../fontes/fonte_api_produtos.dart';

class RepositorioProdutosImpl implements RepositorioProdutos {
  RepositorioProdutosImpl(this._fonte);

  final FonteApiProdutos _fonte;

  @override
  Future<List<Produto>> listarProdutos({int pagina = 0}) async {
    final resposta = await _fonte.listar(pagina: pagina);
    return resposta.products.map((dto) => dto.paraEntidade()).toList();
  }

  @override
  Future<List<Produto>> buscarProdutos(String termo) async {
    final resposta = await _fonte.buscar(termo);
    return resposta.products.map((dto) => dto.paraEntidade()).toList();
  }

  @override
  Future<List<Produto>> listarPorCategoria(String slug) async {
    final resposta = await _fonte.porCategoria(slug);
    return resposta.products.map((dto) => dto.paraEntidade()).toList();
  }

  @override
  Future<Produto> detalhe(int id) async {
    final dto = await _fonte.detalhe(id);
    return dto.paraEntidade();
  }

  @override
  Future<List<Categoria>> listarCategorias() async {
    final dtos = await _fonte.categorias();
    return dtos.map((dto) => dto.paraEntidade()).toList();
  }
}
