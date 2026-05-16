
import 'package:freezed_annotation/freezed_annotation.dart';

part 'videos_filme.freezed.dart';
part 'videos_filme.g.dart';


@freezed
class VideosFilme with _$VideosFilme {
  const factory VideosFilme({
    @JsonKey(name: 'id')
    required int id,
    @JsonKey(name: 'results')
    required List<VideoFilme> results,
  }) = _VideosFilme;

  factory VideosFilme.fromJson(Map<String, dynamic> json) => _$VideosFilmeFromJson(json);
}

@freezed
class VideoFilme with _$VideoFilme {
  const factory VideoFilme({
    @JsonKey(name: 'name')
    required String name,
    @JsonKey(name: 'key')
    required String key,
    @JsonKey(name: 'size')
    required int size,
    @JsonKey(name: 'official')
    required bool official,
    @JsonKey(name: 'published_at')
    required DateTime publishedAt,
    @JsonKey(name: 'id')
    required String id,
  }) = _VideoFilme;

  factory VideoFilme.fromJson(Map<String, dynamic> json) => _$VideoFilmeFromJson(json);
}

