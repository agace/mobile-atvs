// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genero.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Genero _$GeneroFromJson(Map<String, dynamic> json) {
  return _Genero.fromJson(json);
}

/// @nodoc
mixin _$Genero {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeneroCopyWith<Genero> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneroCopyWith<$Res> {
  factory $GeneroCopyWith(Genero value, $Res Function(Genero) then) =
      _$GeneroCopyWithImpl<$Res, Genero>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$GeneroCopyWithImpl<$Res, $Val extends Genero>
    implements $GeneroCopyWith<$Res> {
  _$GeneroCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeneroImplCopyWith<$Res> implements $GeneroCopyWith<$Res> {
  factory _$$GeneroImplCopyWith(
          _$GeneroImpl value, $Res Function(_$GeneroImpl) then) =
      __$$GeneroImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$GeneroImplCopyWithImpl<$Res>
    extends _$GeneroCopyWithImpl<$Res, _$GeneroImpl>
    implements _$$GeneroImplCopyWith<$Res> {
  __$$GeneroImplCopyWithImpl(
      _$GeneroImpl _value, $Res Function(_$GeneroImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$GeneroImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeneroImpl implements _Genero {
  const _$GeneroImpl({required this.id, required this.name});

  factory _$GeneroImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneroImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'Genero(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneroImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneroImplCopyWith<_$GeneroImpl> get copyWith =>
      __$$GeneroImplCopyWithImpl<_$GeneroImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneroImplToJson(
      this,
    );
  }
}

abstract class _Genero implements Genero {
  const factory _Genero({required final int id, required final String name}) =
      _$GeneroImpl;

  factory _Genero.fromJson(Map<String, dynamic> json) = _$GeneroImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$GeneroImplCopyWith<_$GeneroImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Generos _$GenerosFromJson(Map<String, dynamic> json) {
  return _Generos.fromJson(json);
}

/// @nodoc
mixin _$Generos {
  List<Genero> get genres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerosCopyWith<Generos> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerosCopyWith<$Res> {
  factory $GenerosCopyWith(Generos value, $Res Function(Generos) then) =
      _$GenerosCopyWithImpl<$Res, Generos>;
  @useResult
  $Res call({List<Genero> genres});
}

/// @nodoc
class _$GenerosCopyWithImpl<$Res, $Val extends Generos>
    implements $GenerosCopyWith<$Res> {
  _$GenerosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = null,
  }) {
    return _then(_value.copyWith(
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genero>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerosImplCopyWith<$Res> implements $GenerosCopyWith<$Res> {
  factory _$$GenerosImplCopyWith(
          _$GenerosImpl value, $Res Function(_$GenerosImpl) then) =
      __$$GenerosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Genero> genres});
}

/// @nodoc
class __$$GenerosImplCopyWithImpl<$Res>
    extends _$GenerosCopyWithImpl<$Res, _$GenerosImpl>
    implements _$$GenerosImplCopyWith<$Res> {
  __$$GenerosImplCopyWithImpl(
      _$GenerosImpl _value, $Res Function(_$GenerosImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genres = null,
  }) {
    return _then(_$GenerosImpl(
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<Genero>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerosImpl implements _Generos {
  const _$GenerosImpl({required final List<Genero> genres}) : _genres = genres;

  factory _$GenerosImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerosImplFromJson(json);

  final List<Genero> _genres;
  @override
  List<Genero> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  String toString() {
    return 'Generos(genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerosImpl &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_genres));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerosImplCopyWith<_$GenerosImpl> get copyWith =>
      __$$GenerosImplCopyWithImpl<_$GenerosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerosImplToJson(
      this,
    );
  }
}

abstract class _Generos implements Generos {
  const factory _Generos({required final List<Genero> genres}) = _$GenerosImpl;

  factory _Generos.fromJson(Map<String, dynamic> json) = _$GenerosImpl.fromJson;

  @override
  List<Genero> get genres;
  @override
  @JsonKey(ignore: true)
  _$$GenerosImplCopyWith<_$GenerosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
