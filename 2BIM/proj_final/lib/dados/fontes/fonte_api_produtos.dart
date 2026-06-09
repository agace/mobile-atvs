import 'package:dio/dio.dart';

import '../../nucleo/constantes.dart';
import '../modelos/categoria_dto.dart';
import '../modelos/produto_dto.dart';
import '../modelos/resposta_produtos_dto.dart';

class FonteApiProdutos {
  FonteApiProdutos(this._dio);

  final Dio _dio;

  Future<RespostaProdutosDto> listar({int pagina = 0}) async {
    final resposta = await _dio.get<Map<String, dynamic>>(
      '/products',
      queryParameters: {
        'limit': Constantes.tamanhoPagina,
        'skip': pagina * Constantes.tamanhoPagina,
      },
    );
    return RespostaProdutosDto.fromJson(resposta.data!);
  }

  Future<RespostaProdutosDto> buscar(String termo) async {
    final resposta = await _dio.get<Map<String, dynamic>>(
      '/products/search',
      queryParameters: {'q': termo},
    );
    return RespostaProdutosDto.fromJson(resposta.data!);
  }

  Future<RespostaProdutosDto> porCategoria(String slug) async {
    final resposta = await _dio.get<Map<String, dynamic>>(
      '/products/category/$slug',
    );
    return RespostaProdutosDto.fromJson(resposta.data!);
  }

  Future<ProdutoDto> detalhe(int id) async {
    final resposta = await _dio.get<Map<String, dynamic>>('/products/$id');
    return ProdutoDto.fromJson(resposta.data!);
  }

  Future<List<CategoriaDto>> categorias() async {
    final resposta = await _dio.get<List<dynamic>>('/products/categories');
    return resposta.data!
        .map((e) => CategoriaDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
