// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resposta_filmes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RespostaFilmes _$RespostaFilmesFromJson(Map<String, dynamic> json) {
  return _RespostaFilmes.fromJson(json);
}

/// @nodoc
mixin _$RespostaFilmes {
  int get page => throw _privateConstructorUsedError;
  List<ResultadoFilme> get results => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_results')
  int get totalResults => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RespostaFilmesCopyWith<RespostaFilmes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RespostaFilmesCopyWith<$Res> {
  factory $RespostaFilmesCopyWith(
          RespostaFilmes value, $Res Function(RespostaFilmes) then) =
      _$RespostaFilmesCopyWithImpl<$Res, RespostaFilmes>;
  @useResult
  $Res call(
      {int page,
      List<ResultadoFilme> results,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'total_results') int totalResults});
}

/// @nodoc
class _$RespostaFilmesCopyWithImpl<$Res, $Val extends RespostaFilmes>
    implements $RespostaFilmesCopyWith<$Res> {
  _$RespostaFilmesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ResultadoFilme>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RespostaFilmesImplCopyWith<$Res>
    implements $RespostaFilmesCopyWith<$Res> {
  factory _$$RespostaFilmesImplCopyWith(_$RespostaFilmesImpl value,
          $Res Function(_$RespostaFilmesImpl) then) =
      __$$RespostaFilmesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      List<ResultadoFilme> results,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'total_results') int totalResults});
}

/// @nodoc
class __$$RespostaFilmesImplCopyWithImpl<$Res>
    extends _$RespostaFilmesCopyWithImpl<$Res, _$RespostaFilmesImpl>
    implements _$$RespostaFilmesImplCopyWith<$Res> {
  __$$RespostaFilmesImplCopyWithImpl(
      _$RespostaFilmesImpl _value, $Res Function(_$RespostaFilmesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? totalPages = null,
    Object? totalResults = null,
  }) {
    return _then(_$RespostaFilmesImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<ResultadoFilme>,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RespostaFilmesImpl implements _RespostaFilmes {
  const _$RespostaFilmesImpl(
      {required this.page,
      required final List<ResultadoFilme> results,
      @JsonKey(name: 'total_pages') required this.totalPages,
      @JsonKey(name: 'total_results') required this.totalResults})
      : _results = results;

  factory _$RespostaFilmesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RespostaFilmesImplFromJson(json);

  @override
  final int page;
  final List<ResultadoFilme> _results;
  @override
  List<ResultadoFilme> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @override
  @JsonKey(name: 'total_results')
  final int totalResults;

  @override
  String toString() {
    return 'RespostaFilmes(page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RespostaFilmesImpl &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page,
      const DeepCollectionEquality().hash(_results), totalPages, totalResults);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RespostaFilmesImplCopyWith<_$RespostaFilmesImpl> get copyWith =>
      __$$RespostaFilmesImplCopyWithImpl<_$RespostaFilmesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RespostaFilmesImplToJson(
      this,
    );
  }
}

abstract class _RespostaFilmes implements RespostaFilmes {
  const factory _RespostaFilmes(
          {required final int page,
          required final List<ResultadoFilme> results,
          @JsonKey(name: 'total_pages') required final int totalPages,
          @JsonKey(name: 'total_results') required final int totalResults}) =
      _$RespostaFilmesImpl;

  factory _RespostaFilmes.fromJson(Map<String, dynamic> json) =
      _$RespostaFilmesImpl.fromJson;

  @override
  int get page;
  @override
  List<ResultadoFilme> get results;
  @override
  @JsonKey(name: 'total_pages')
  int get totalPages;
  @override
  @JsonKey(name: 'total_results')
  int get totalResults;
  @override
  @JsonKey(ignore: true)
  _$$RespostaFilmesImplCopyWith<_$RespostaFilmesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
