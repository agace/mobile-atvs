// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creditos_filme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreditosFilmeImpl _$$CreditosFilmeImplFromJson(Map<String, dynamic> json) =>
    _$CreditosFilmeImpl(
      id: (json['id'] as num).toInt(),
      cast: (json['cast'] as List<dynamic>)
          .map((e) => ElencoFilme.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => ElencoFilme.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CreditosFilmeImplToJson(_$CreditosFilmeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };

_$ElencoFilmeImpl _$$ElencoFilmeImplFromJson(Map<String, dynamic> json) =>
    _$ElencoFilmeImpl(
      adult: json['adult'] as bool,
      gender: (json['gender'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
      castId: (json['cast_id'] as num?)?.toInt(),
      character: json['character'] as String?,
      creditId: json['credit_id'] as String,
      order: (json['order'] as num?)?.toInt(),
      job: json['job'] as String?,
    );

Map<String, dynamic> _$$ElencoFilmeImplToJson(_$ElencoFilmeImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'cast_id': instance.castId,
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
      'job': instance.job,
    };
