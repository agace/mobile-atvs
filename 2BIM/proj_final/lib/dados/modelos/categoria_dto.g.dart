// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoriaDtoImpl _$$CategoriaDtoImplFromJson(Map<String, dynamic> json) =>
    _$CategoriaDtoImpl(
      slug: json['slug'] as String,
      name: json['name'] as String,
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$$CategoriaDtoImplToJson(_$CategoriaDtoImpl instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'name': instance.name,
      'url': instance.url,
    };
