// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'videos_filme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VideosFilme _$VideosFilmeFromJson(Map<String, dynamic> json) {
  return _VideosFilme.fromJson(json);
}

/// @nodoc
mixin _$VideosFilme {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'results')
  List<VideoFilme> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideosFilmeCopyWith<VideosFilme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideosFilmeCopyWith<$Res> {
  factory $VideosFilmeCopyWith(
          VideosFilme value, $Res Function(VideosFilme) then) =
      _$VideosFilmeCopyWithImpl<$Res, VideosFilme>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'results') List<VideoFilme> results});
}

/// @nodoc
class _$VideosFilmeCopyWithImpl<$Res, $Val extends VideosFilme>
    implements $VideosFilmeCopyWith<$Res> {
  _$VideosFilmeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<VideoFilme>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideosFilmeImplCopyWith<$Res>
    implements $VideosFilmeCopyWith<$Res> {
  factory _$$VideosFilmeImplCopyWith(
          _$VideosFilmeImpl value, $Res Function(_$VideosFilmeImpl) then) =
      __$$VideosFilmeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'results') List<VideoFilme> results});
}

/// @nodoc
class __$$VideosFilmeImplCopyWithImpl<$Res>
    extends _$VideosFilmeCopyWithImpl<$Res, _$VideosFilmeImpl>
    implements _$$VideosFilmeImplCopyWith<$Res> {
  __$$VideosFilmeImplCopyWithImpl(
      _$VideosFilmeImpl _value, $Res Function(_$VideosFilmeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? results = null,
  }) {
    return _then(_$VideosFilmeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<VideoFilme>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideosFilmeImpl implements _VideosFilme {
  const _$VideosFilmeImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'results') required final List<VideoFilme> results})
      : _results = results;

  factory _$VideosFilmeImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideosFilmeImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  final List<VideoFilme> _results;
  @override
  @JsonKey(name: 'results')
  List<VideoFilme> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'VideosFilme(id: $id, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideosFilmeImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideosFilmeImplCopyWith<_$VideosFilmeImpl> get copyWith =>
      __$$VideosFilmeImplCopyWithImpl<_$VideosFilmeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideosFilmeImplToJson(
      this,
    );
  }
}

abstract class _VideosFilme implements VideosFilme {
  const factory _VideosFilme(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'results') required final List<VideoFilme> results}) =
      _$VideosFilmeImpl;

  factory _VideosFilme.fromJson(Map<String, dynamic> json) =
      _$VideosFilmeImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'results')
  List<VideoFilme> get results;
  @override
  @JsonKey(ignore: true)
  _$$VideosFilmeImplCopyWith<_$VideosFilmeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VideoFilme _$VideoFilmeFromJson(Map<String, dynamic> json) {
  return _VideoFilme.fromJson(json);
}

/// @nodoc
mixin _$VideoFilme {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'key')
  String get key => throw _privateConstructorUsedError;
  @JsonKey(name: 'size')
  int get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'official')
  bool get official => throw _privateConstructorUsedError;
  @JsonKey(name: 'published_at')
  DateTime get publishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoFilmeCopyWith<VideoFilme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoFilmeCopyWith<$Res> {
  factory $VideoFilmeCopyWith(
          VideoFilme value, $Res Function(VideoFilme) then) =
      _$VideoFilmeCopyWithImpl<$Res, VideoFilme>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'key') String key,
      @JsonKey(name: 'size') int size,
      @JsonKey(name: 'official') bool official,
      @JsonKey(name: 'published_at') DateTime publishedAt,
      @JsonKey(name: 'id') String id});
}

/// @nodoc
class _$VideoFilmeCopyWithImpl<$Res, $Val extends VideoFilme>
    implements $VideoFilmeCopyWith<$Res> {
  _$VideoFilmeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? size = null,
    Object? official = null,
    Object? publishedAt = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      official: null == official
          ? _value.official
          : official // ignore: cast_nullable_to_non_nullable
              as bool,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoFilmeImplCopyWith<$Res>
    implements $VideoFilmeCopyWith<$Res> {
  factory _$$VideoFilmeImplCopyWith(
          _$VideoFilmeImpl value, $Res Function(_$VideoFilmeImpl) then) =
      __$$VideoFilmeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'key') String key,
      @JsonKey(name: 'size') int size,
      @JsonKey(name: 'official') bool official,
      @JsonKey(name: 'published_at') DateTime publishedAt,
      @JsonKey(name: 'id') String id});
}

/// @nodoc
class __$$VideoFilmeImplCopyWithImpl<$Res>
    extends _$VideoFilmeCopyWithImpl<$Res, _$VideoFilmeImpl>
    implements _$$VideoFilmeImplCopyWith<$Res> {
  __$$VideoFilmeImplCopyWithImpl(
      _$VideoFilmeImpl _value, $Res Function(_$VideoFilmeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? key = null,
    Object? size = null,
    Object? official = null,
    Object? publishedAt = null,
    Object? id = null,
  }) {
    return _then(_$VideoFilmeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      official: null == official
          ? _value.official
          : official // ignore: cast_nullable_to_non_nullable
              as bool,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoFilmeImpl implements _VideoFilme {
  const _$VideoFilmeImpl(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'key') required this.key,
      @JsonKey(name: 'size') required this.size,
      @JsonKey(name: 'official') required this.official,
      @JsonKey(name: 'published_at') required this.publishedAt,
      @JsonKey(name: 'id') required this.id});

  factory _$VideoFilmeImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoFilmeImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'key')
  final String key;
  @override
  @JsonKey(name: 'size')
  final int size;
  @override
  @JsonKey(name: 'official')
  final bool official;
  @override
  @JsonKey(name: 'published_at')
  final DateTime publishedAt;
  @override
  @JsonKey(name: 'id')
  final String id;

  @override
  String toString() {
    return 'VideoFilme(name: $name, key: $key, size: $size, official: $official, publishedAt: $publishedAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoFilmeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.official, official) ||
                other.official == official) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, key, size, official, publishedAt, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoFilmeImplCopyWith<_$VideoFilmeImpl> get copyWith =>
      __$$VideoFilmeImplCopyWithImpl<_$VideoFilmeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoFilmeImplToJson(
      this,
    );
  }
}

abstract class _VideoFilme implements VideoFilme {
  const factory _VideoFilme(
      {@JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'key') required final String key,
      @JsonKey(name: 'size') required final int size,
      @JsonKey(name: 'official') required final bool official,
      @JsonKey(name: 'published_at') required final DateTime publishedAt,
      @JsonKey(name: 'id') required final String id}) = _$VideoFilmeImpl;

  factory _VideoFilme.fromJson(Map<String, dynamic> json) =
      _$VideoFilmeImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'key')
  String get key;
  @override
  @JsonKey(name: 'size')
  int get size;
  @override
  @JsonKey(name: 'official')
  bool get official;
  @override
  @JsonKey(name: 'published_at')
  DateTime get publishedAt;
  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$VideoFilmeImplCopyWith<_$VideoFilmeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
