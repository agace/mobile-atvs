import 'package:freezed_annotation/freezed_annotation.dart';

import 'produto_dto.dart';

part 'resposta_produtos_dto.freezed.dart';
part 'resposta_produtos_dto.g.dart';

@freezed
class RespostaProdutosDto with _$RespostaProdutosDto {
  const factory RespostaProdutosDto({
    @Default(<ProdutoDto>[]) List<ProdutoDto> products,
    @Default(0) int total,
    @Default(0) int skip,
    @Default(0) int limit,
  }) = _RespostaProdutosDto;

  factory RespostaProdutosDto.fromJson(Map<String, dynamic> json) =>
      _$RespostaProdutosDtoFromJson(json);
}
