// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resposta_filmes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RespostaFilmesImpl _$$RespostaFilmesImplFromJson(Map<String, dynamic> json) =>
    _$RespostaFilmesImpl(
      page: (json['page'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => ResultadoFilme.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num).toInt(),
      totalResults: (json['total_results'] as num).toInt(),
    );

Map<String, dynamic> _$$RespostaFilmesImplToJson(
        _$RespostaFilmesImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
