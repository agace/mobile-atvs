import 'package:freezed_annotation/freezed_annotation.dart';

part 'creditos_filme.freezed.dart';
part 'creditos_filme.g.dart';

@freezed
class CreditosFilme with _$CreditosFilme {
  const factory CreditosFilme({
    @JsonKey(name: 'id')
    required int id,
    @JsonKey(name: 'cast')
    required List<ElencoFilme> cast,
    @JsonKey(name: 'crew')
    required List<ElencoFilme> crew,
  }) = _CreditosFilme;

  factory CreditosFilme.fromJson(Map<String, dynamic> json) => _$CreditosFilmeFromJson(json);
}

@freezed
class ElencoFilme with _$ElencoFilme {
  const factory ElencoFilme({
    @JsonKey(name: 'adult')
    required bool adult,
    @JsonKey(name: 'gender')
    required int gender,
    @JsonKey(name: 'id')
    required int id,
    @JsonKey(name: 'name')
    required String name,
    @JsonKey(name: 'original_name')
    required String originalName,
    @JsonKey(name: 'popularity')
    required double popularity,
    @JsonKey(name: 'profile_path')
    required String? profilePath,
    @JsonKey(name: 'cast_id')
    int? castId,
    @JsonKey(name: 'character')
    String? character,
    @JsonKey(name: 'credit_id')
    required String creditId,
    @JsonKey(name: 'order')
    int? order,
    @JsonKey(name: 'job')
    String? job,
  }) = _ElencoFilme;

  factory ElencoFilme.fromJson(Map<String, dynamic> json) => _$ElencoFilmeFromJson(json);
}


