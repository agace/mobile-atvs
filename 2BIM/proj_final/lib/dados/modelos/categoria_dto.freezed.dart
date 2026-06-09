// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categoria_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CategoriaDto _$CategoriaDtoFromJson(Map<String, dynamic> json) {
  return _CategoriaDto.fromJson(json);
}

/// @nodoc
mixin _$CategoriaDto {
  String get slug => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this CategoriaDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoriaDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoriaDtoCopyWith<CategoriaDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriaDtoCopyWith<$Res> {
  factory $CategoriaDtoCopyWith(
    CategoriaDto value,
    $Res Function(CategoriaDto) then,
  ) = _$CategoriaDtoCopyWithImpl<$Res, CategoriaDto>;
  @useResult
  $Res call({String slug, String name, String url});
}

/// @nodoc
class _$CategoriaDtoCopyWithImpl<$Res, $Val extends CategoriaDto>
    implements $CategoriaDtoCopyWith<$Res> {
  _$CategoriaDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoriaDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? slug = null, Object? name = null, Object? url = null}) {
    return _then(
      _value.copyWith(
            slug: null == slug
                ? _value.slug
                : slug // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoriaDtoImplCopyWith<$Res>
    implements $CategoriaDtoCopyWith<$Res> {
  factory _$$CategoriaDtoImplCopyWith(
    _$CategoriaDtoImpl value,
    $Res Function(_$CategoriaDtoImpl) then,
  ) = __$$CategoriaDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String slug, String name, String url});
}

/// @nodoc
class __$$CategoriaDtoImplCopyWithImpl<$Res>
    extends _$CategoriaDtoCopyWithImpl<$Res, _$CategoriaDtoImpl>
    implements _$$CategoriaDtoImplCopyWith<$Res> {
  __$$CategoriaDtoImplCopyWithImpl(
    _$CategoriaDtoImpl _value,
    $Res Function(_$CategoriaDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoriaDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? slug = null, Object? name = null, Object? url = null}) {
    return _then(
      _$CategoriaDtoImpl(
        slug: null == slug
            ? _value.slug
            : slug // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoriaDtoImpl extends _CategoriaDto {
  const _$CategoriaDtoImpl({
    required this.slug,
    required this.name,
    this.url = '',
  }) : super._();

  factory _$CategoriaDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoriaDtoImplFromJson(json);

  @override
  final String slug;
  @override
  final String name;
  @override
  @JsonKey()
  final String url;

  @override
  String toString() {
    return 'CategoriaDto(slug: $slug, name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriaDtoImpl &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, slug, name, url);

  /// Create a copy of CategoriaDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriaDtoImplCopyWith<_$CategoriaDtoImpl> get copyWith =>
      __$$CategoriaDtoImplCopyWithImpl<_$CategoriaDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoriaDtoImplToJson(this);
  }
}

abstract class _CategoriaDto extends CategoriaDto {
  const factory _CategoriaDto({
    required final String slug,
    required final String name,
    final String url,
  }) = _$CategoriaDtoImpl;
  const _CategoriaDto._() : super._();

  factory _CategoriaDto.fromJson(Map<String, dynamic> json) =
      _$CategoriaDtoImpl.fromJson;

  @override
  String get slug;
  @override
  String get name;
  @override
  String get url;

  /// Create a copy of CategoriaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoriaDtoImplCopyWith<_$CategoriaDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
