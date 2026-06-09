import 'package:freezed_annotation/freezed_annotation.dart';

import '../../dominio/entidades/categoria.dart';

part 'categoria_dto.freezed.dart';
part 'categoria_dto.g.dart';

@freezed
class CategoriaDto with _$CategoriaDto {
  const CategoriaDto._();

  const factory CategoriaDto({
    required String slug,
    required String name,
    @Default('') String url,
  }) = _CategoriaDto;

  factory CategoriaDto.fromJson(Map<String, dynamic> json) =>
      _$CategoriaDtoFromJson(json);

  Categoria paraEntidade() => Categoria(slug: slug, nome: name);
}
