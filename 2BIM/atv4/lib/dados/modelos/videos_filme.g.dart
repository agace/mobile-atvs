// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videos_filme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideosFilmeImpl _$$VideosFilmeImplFromJson(Map<String, dynamic> json) =>
    _$VideosFilmeImpl(
      id: (json['id'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => VideoFilme.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VideosFilmeImplToJson(_$VideosFilmeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };

_$VideoFilmeImpl _$$VideoFilmeImplFromJson(Map<String, dynamic> json) =>
    _$VideoFilmeImpl(
      name: json['name'] as String,
      key: json['key'] as String,
      size: (json['size'] as num).toInt(),
      official: json['official'] as bool,
      publishedAt: DateTime.parse(json['published_at'] as String),
      id: json['id'] as String,
    );

Map<String, dynamic> _$$VideoFilmeImplToJson(_$VideoFilmeImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'size': instance.size,
      'official': instance.official,
      'published_at': instance.publishedAt.toIso8601String(),
      'id': instance.id,
    };
