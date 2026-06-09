import 'package:freezed_annotation/freezed_annotation.dart';

import '../../dominio/entidades/produto.dart';

part 'produto_dto.freezed.dart';
part 'produto_dto.g.dart';

@freezed
class ProdutoDto with _$ProdutoDto {
  const ProdutoDto._();

  const factory ProdutoDto({
    required int id,
    required String title,
    @Default('') String description,
    @Default('') String category,
    @Default(0) double price,
    @Default(0) double discountPercentage,
    @Default(0) double rating,
    @Default(0) int stock,
    @Default('') String brand,
    @Default('') String thumbnail,
    @Default(<String>[]) List<String> images,
  }) = _ProdutoDto;

  factory ProdutoDto.fromJson(Map<String, dynamic> json) =>
      _$ProdutoDtoFromJson(json);

  Produto paraEntidade() {
    return Produto(
      id: id,
      titulo: title,
      descricao: description,
      categoria: category,
      preco: price,
      percentualDesconto: discountPercentage,
      avaliacao: rating,
      estoque: stock,
      marca: brand,
      miniatura: thumbnail,
      imagens: images,
    );
  }
}
