// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resposta_produtos_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RespostaProdutosDto _$RespostaProdutosDtoFromJson(Map<String, dynamic> json) {
  return _RespostaProdutosDto.fromJson(json);
}

/// @nodoc
mixin _$RespostaProdutosDto {
  List<ProdutoDto> get products => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get skip => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  /// Serializes this RespostaProdutosDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RespostaProdutosDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RespostaProdutosDtoCopyWith<RespostaProdutosDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RespostaProdutosDtoCopyWith<$Res> {
  factory $RespostaProdutosDtoCopyWith(
    RespostaProdutosDto value,
    $Res Function(RespostaProdutosDto) then,
  ) = _$RespostaProdutosDtoCopyWithImpl<$Res, RespostaProdutosDto>;
  @useResult
  $Res call({List<ProdutoDto> products, int total, int skip, int limit});
}

/// @nodoc
class _$RespostaProdutosDtoCopyWithImpl<$Res, $Val extends RespostaProdutosDto>
    implements $RespostaProdutosDtoCopyWith<$Res> {
  _$RespostaProdutosDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RespostaProdutosDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? total = null,
    Object? skip = null,
    Object? limit = null,
  }) {
    return _then(
      _value.copyWith(
            products: null == products
                ? _value.products
                : products // ignore: cast_nullable_to_non_nullable
                      as List<ProdutoDto>,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            skip: null == skip
                ? _value.skip
                : skip // ignore: cast_nullable_to_non_nullable
                      as int,
            limit: null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RespostaProdutosDtoImplCopyWith<$Res>
    implements $RespostaProdutosDtoCopyWith<$Res> {
  factory _$$RespostaProdutosDtoImplCopyWith(
    _$RespostaProdutosDtoImpl value,
    $Res Function(_$RespostaProdutosDtoImpl) then,
  ) = __$$RespostaProdutosDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProdutoDto> products, int total, int skip, int limit});
}

/// @nodoc
class __$$RespostaProdutosDtoImplCopyWithImpl<$Res>
    extends _$RespostaProdutosDtoCopyWithImpl<$Res, _$RespostaProdutosDtoImpl>
    implements _$$RespostaProdutosDtoImplCopyWith<$Res> {
  __$$RespostaProdutosDtoImplCopyWithImpl(
    _$RespostaProdutosDtoImpl _value,
    $Res Function(_$RespostaProdutosDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RespostaProdutosDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? total = null,
    Object? skip = null,
    Object? limit = null,
  }) {
    return _then(
      _$RespostaProdutosDtoImpl(
        products: null == products
            ? _value._products
            : products // ignore: cast_nullable_to_non_nullable
                  as List<ProdutoDto>,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        skip: null == skip
            ? _value.skip
            : skip // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RespostaProdutosDtoImpl implements _RespostaProdutosDto {
  const _$RespostaProdutosDtoImpl({
    final List<ProdutoDto> products = const <ProdutoDto>[],
    this.total = 0,
    this.skip = 0,
    this.limit = 0,
  }) : _products = products;

  factory _$RespostaProdutosDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RespostaProdutosDtoImplFromJson(json);

  final List<ProdutoDto> _products;
  @override
  @JsonKey()
  List<ProdutoDto> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int skip;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'RespostaProdutosDto(products: $products, total: $total, skip: $skip, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RespostaProdutosDtoImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.skip, skip) || other.skip == skip) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_products),
    total,
    skip,
    limit,
  );

  /// Create a copy of RespostaProdutosDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RespostaProdutosDtoImplCopyWith<_$RespostaProdutosDtoImpl> get copyWith =>
      __$$RespostaProdutosDtoImplCopyWithImpl<_$RespostaProdutosDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RespostaProdutosDtoImplToJson(this);
  }
}

abstract class _RespostaProdutosDto implements RespostaProdutosDto {
  const factory _RespostaProdutosDto({
    final List<ProdutoDto> products,
    final int total,
    final int skip,
    final int limit,
  }) = _$RespostaProdutosDtoImpl;

  factory _RespostaProdutosDto.fromJson(Map<String, dynamic> json) =
      _$RespostaProdutosDtoImpl.fromJson;

  @override
  List<ProdutoDto> get products;
  @override
  int get total;
  @override
  int get skip;
  @override
  int get limit;

  /// Create a copy of RespostaProdutosDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RespostaProdutosDtoImplCopyWith<_$RespostaProdutosDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
