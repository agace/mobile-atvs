import 'package:freezed_annotation/freezed_annotation.dart';

part 'genero.freezed.dart';

part 'genero.g.dart';

@freezed
class Genero with _$Genero {
  const factory Genero({
    required int id,
    required String name,
  }) = _Genero;

  factory Genero.fromJson(Map<String, dynamic> json) => _$GeneroFromJson(json);
}

@freezed
class Generos with _$Generos {
  const factory Generos({
    required List<Genero> genres,
  }) = _Generos;

  factory Generos.fromJson(Map<String, dynamic> json) => _$GenerosFromJson(json);
}

