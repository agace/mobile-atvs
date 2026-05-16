// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneroImpl _$$GeneroImplFromJson(Map<String, dynamic> json) => _$GeneroImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$GeneroImplToJson(_$GeneroImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$GenerosImpl _$$GenerosImplFromJson(Map<String, dynamic> json) =>
    _$GenerosImpl(
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genero.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GenerosImplToJson(_$GenerosImpl instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
