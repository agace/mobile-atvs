import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:filmes/dados/modelos/resultado_filme.dart';

part 'resposta_filmes.freezed.dart';

part 'resposta_filmes.g.dart';

@freezed
class RespostaFilmes with _$RespostaFilmes {
  const factory RespostaFilmes({
    required int page,
    required List<ResultadoFilme> results,
    @JsonKey(name: 'total_pages')
    required int totalPages,
    @JsonKey(name: 'total_results')
    required int totalResults
  }) = _RespostaFilmes;

  factory RespostaFilmes.fromJson(Map<String, dynamic>  json) => _$RespostaFilmesFromJson(json);

}