// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resposta_produtos_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RespostaProdutosDtoImpl _$$RespostaProdutosDtoImplFromJson(
  Map<String, dynamic> json,
) => _$RespostaProdutosDtoImpl(
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => ProdutoDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProdutoDto>[],
  total: (json['total'] as num?)?.toInt() ?? 0,
  skip: (json['skip'] as num?)?.toInt() ?? 0,
  limit: (json['limit'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$RespostaProdutosDtoImplToJson(
  _$RespostaProdutosDtoImpl instance,
) => <String, dynamic>{
  'products': instance.products,
  'total': instance.total,
  'skip': instance.skip,
  'limit': instance.limit,
};
