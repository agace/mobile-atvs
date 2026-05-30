// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'creditos_filme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreditosFilme _$CreditosFilmeFromJson(Map<String, dynamic> json) {
  return _CreditosFilme.fromJson(json);
}

/// @nodoc
mixin _$CreditosFilme {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'cast')
  List<ElencoFilme> get cast => throw _privateConstructorUsedError;
  @JsonKey(name: 'crew')
  List<ElencoFilme> get crew => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditosFilmeCopyWith<CreditosFilme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditosFilmeCopyWith<$Res> {
  factory $CreditosFilmeCopyWith(
          CreditosFilme value, $Res Function(CreditosFilme) then) =
      _$CreditosFilmeCopyWithImpl<$Res, CreditosFilme>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'cast') List<ElencoFilme> cast,
      @JsonKey(name: 'crew') List<ElencoFilme> crew});
}

/// @nodoc
class _$CreditosFilmeCopyWithImpl<$Res, $Val extends CreditosFilme>
    implements $CreditosFilmeCopyWith<$Res> {
  _$CreditosFilmeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cast = null,
    Object? crew = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cast: null == cast
          ? _value.cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<ElencoFilme>,
      crew: null == crew
          ? _value.crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<ElencoFilme>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditosFilmeImplCopyWith<$Res>
    implements $CreditosFilmeCopyWith<$Res> {
  factory _$$CreditosFilmeImplCopyWith(
          _$CreditosFilmeImpl value, $Res Function(_$CreditosFilmeImpl) then) =
      __$$CreditosFilmeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'cast') List<ElencoFilme> cast,
      @JsonKey(name: 'crew') List<ElencoFilme> crew});
}

/// @nodoc
class __$$CreditosFilmeImplCopyWithImpl<$Res>
    extends _$CreditosFilmeCopyWithImpl<$Res, _$CreditosFilmeImpl>
    implements _$$CreditosFilmeImplCopyWith<$Res> {
  __$$CreditosFilmeImplCopyWithImpl(
      _$CreditosFilmeImpl _value, $Res Function(_$CreditosFilmeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cast = null,
    Object? crew = null,
  }) {
    return _then(_$CreditosFilmeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cast: null == cast
          ? _value._cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<ElencoFilme>,
      crew: null == crew
          ? _value._crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<ElencoFilme>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreditosFilmeImpl implements _CreditosFilme {
  const _$CreditosFilmeImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'cast') required final List<ElencoFilme> cast,
      @JsonKey(name: 'crew') required final List<ElencoFilme> crew})
      : _cast = cast,
        _crew = crew;

  factory _$CreditosFilmeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreditosFilmeImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  final List<ElencoFilme> _cast;
  @override
  @JsonKey(name: 'cast')
  List<ElencoFilme> get cast {
    if (_cast is EqualUnmodifiableListView) return _cast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cast);
  }

  final List<ElencoFilme> _crew;
  @override
  @JsonKey(name: 'crew')
  List<ElencoFilme> get crew {
    if (_crew is EqualUnmodifiableListView) return _crew;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_crew);
  }

  @override
  String toString() {
    return 'CreditosFilme(id: $id, cast: $cast, crew: $crew)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditosFilmeImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._cast, _cast) &&
            const DeepCollectionEquality().equals(other._crew, _crew));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_cast),
      const DeepCollectionEquality().hash(_crew));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditosFilmeImplCopyWith<_$CreditosFilmeImpl> get copyWith =>
      __$$CreditosFilmeImplCopyWithImpl<_$CreditosFilmeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditosFilmeImplToJson(
      this,
    );
  }
}

abstract class _CreditosFilme implements CreditosFilme {
  const factory _CreditosFilme(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'cast') required final List<ElencoFilme> cast,
          @JsonKey(name: 'crew') required final List<ElencoFilme> crew}) =
      _$CreditosFilmeImpl;

  factory _CreditosFilme.fromJson(Map<String, dynamic> json) =
      _$CreditosFilmeImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'cast')
  List<ElencoFilme> get cast;
  @override
  @JsonKey(name: 'crew')
  List<ElencoFilme> get crew;
  @override
  @JsonKey(ignore: true)
  _$$CreditosFilmeImplCopyWith<_$CreditosFilmeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ElencoFilme _$ElencoFilmeFromJson(Map<String, dynamic> json) {
  return _ElencoFilme.fromJson(json);
}

/// @nodoc
mixin _$ElencoFilme {
  @JsonKey(name: 'adult')
  bool get adult => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  int get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_name')
  String get originalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'popularity')
  double get popularity => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_path')
  String? get profilePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'cast_id')
  int? get castId => throw _privateConstructorUsedError;
  @JsonKey(name: 'character')
  String? get character => throw _privateConstructorUsedError;
  @JsonKey(name: 'credit_id')
  String get creditId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order')
  int? get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'job')
  String? get job => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElencoFilmeCopyWith<ElencoFilme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElencoFilmeCopyWith<$Res> {
  factory $ElencoFilmeCopyWith(
          ElencoFilme value, $Res Function(ElencoFilme) then) =
      _$ElencoFilmeCopyWithImpl<$Res, ElencoFilme>;
  @useResult
  $Res call(
      {@JsonKey(name: 'adult') bool adult,
      @JsonKey(name: 'gender') int gender,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'original_name') String originalName,
      @JsonKey(name: 'popularity') double popularity,
      @JsonKey(name: 'profile_path') String? profilePath,
      @JsonKey(name: 'cast_id') int? castId,
      @JsonKey(name: 'character') String? character,
      @JsonKey(name: 'credit_id') String creditId,
      @JsonKey(name: 'order') int? order,
      @JsonKey(name: 'job') String? job});
}

/// @nodoc
class _$ElencoFilmeCopyWithImpl<$Res, $Val extends ElencoFilme>
    implements $ElencoFilmeCopyWith<$Res> {
  _$ElencoFilmeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? gender = null,
    Object? id = null,
    Object? name = null,
    Object? originalName = null,
    Object? popularity = null,
    Object? profilePath = freezed,
    Object? castId = freezed,
    Object? character = freezed,
    Object? creditId = null,
    Object? order = freezed,
    Object? job = freezed,
  }) {
    return _then(_value.copyWith(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      castId: freezed == castId
          ? _value.castId
          : castId // ignore: cast_nullable_to_non_nullable
              as int?,
      character: freezed == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String?,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      job: freezed == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ElencoFilmeImplCopyWith<$Res>
    implements $ElencoFilmeCopyWith<$Res> {
  factory _$$ElencoFilmeImplCopyWith(
          _$ElencoFilmeImpl value, $Res Function(_$ElencoFilmeImpl) then) =
      __$$ElencoFilmeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'adult') bool adult,
      @JsonKey(name: 'gender') int gender,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'original_name') String originalName,
      @JsonKey(name: 'popularity') double popularity,
      @JsonKey(name: 'profile_path') String? profilePath,
      @JsonKey(name: 'cast_id') int? castId,
      @JsonKey(name: 'character') String? character,
      @JsonKey(name: 'credit_id') String creditId,
      @JsonKey(name: 'order') int? order,
      @JsonKey(name: 'job') String? job});
}

/// @nodoc
class __$$ElencoFilmeImplCopyWithImpl<$Res>
    extends _$ElencoFilmeCopyWithImpl<$Res, _$ElencoFilmeImpl>
    implements _$$ElencoFilmeImplCopyWith<$Res> {
  __$$ElencoFilmeImplCopyWithImpl(
      _$ElencoFilmeImpl _value, $Res Function(_$ElencoFilmeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? gender = null,
    Object? id = null,
    Object? name = null,
    Object? originalName = null,
    Object? popularity = null,
    Object? profilePath = freezed,
    Object? castId = freezed,
    Object? character = freezed,
    Object? creditId = null,
    Object? order = freezed,
    Object? job = freezed,
  }) {
    return _then(_$ElencoFilmeImpl(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      originalName: null == originalName
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      castId: freezed == castId
          ? _value.castId
          : castId // ignore: cast_nullable_to_non_nullable
              as int?,
      character: freezed == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String?,
      creditId: null == creditId
          ? _value.creditId
          : creditId // ignore: cast_nullable_to_non_nullable
              as String,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      job: freezed == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ElencoFilmeImpl implements _ElencoFilme {
  const _$ElencoFilmeImpl(
      {@JsonKey(name: 'adult') required this.adult,
      @JsonKey(name: 'gender') required this.gender,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'original_name') required this.originalName,
      @JsonKey(name: 'popularity') required this.popularity,
      @JsonKey(name: 'profile_path') required this.profilePath,
      @JsonKey(name: 'cast_id') this.castId,
      @JsonKey(name: 'character') this.character,
      @JsonKey(name: 'credit_id') required this.creditId,
      @JsonKey(name: 'order') this.order,
      @JsonKey(name: 'job') this.job});

  factory _$ElencoFilmeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElencoFilmeImplFromJson(json);

  @override
  @JsonKey(name: 'adult')
  final bool adult;
  @override
  @JsonKey(name: 'gender')
  final int gender;
  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'original_name')
  final String originalName;
  @override
  @JsonKey(name: 'popularity')
  final double popularity;
  @override
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @override
  @JsonKey(name: 'cast_id')
  final int? castId;
  @override
  @JsonKey(name: 'character')
  final String? character;
  @override
  @JsonKey(name: 'credit_id')
  final String creditId;
  @override
  @JsonKey(name: 'order')
  final int? order;
  @override
  @JsonKey(name: 'job')
  final String? job;

  @override
  String toString() {
    return 'ElencoFilme(adult: $adult, gender: $gender, id: $id, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, castId: $castId, character: $character, creditId: $creditId, order: $order, job: $job)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElencoFilmeImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath) &&
            (identical(other.castId, castId) || other.castId == castId) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.creditId, creditId) ||
                other.creditId == creditId) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.job, job) || other.job == job));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      adult,
      gender,
      id,
      name,
      originalName,
      popularity,
      profilePath,
      castId,
      character,
      creditId,
      order,
      job);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ElencoFilmeImplCopyWith<_$ElencoFilmeImpl> get copyWith =>
      __$$ElencoFilmeImplCopyWithImpl<_$ElencoFilmeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ElencoFilmeImplToJson(
      this,
    );
  }
}

abstract class _ElencoFilme implements ElencoFilme {
  const factory _ElencoFilme(
      {@JsonKey(name: 'adult') required final bool adult,
      @JsonKey(name: 'gender') required final int gender,
      @JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'original_name') required final String originalName,
      @JsonKey(name: 'popularity') required final double popularity,
      @JsonKey(name: 'profile_path') required final String? profilePath,
      @JsonKey(name: 'cast_id') final int? castId,
      @JsonKey(name: 'character') final String? character,
      @JsonKey(name: 'credit_id') required final String creditId,
      @JsonKey(name: 'order') final int? order,
      @JsonKey(name: 'job') final String? job}) = _$ElencoFilmeImpl;

  factory _ElencoFilme.fromJson(Map<String, dynamic> json) =
      _$ElencoFilmeImpl.fromJson;

  @override
  @JsonKey(name: 'adult')
  bool get adult;
  @override
  @JsonKey(name: 'gender')
  int get gender;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'original_name')
  String get originalName;
  @override
  @JsonKey(name: 'popularity')
  double get popularity;
  @override
  @JsonKey(name: 'profile_path')
  String? get profilePath;
  @override
  @JsonKey(name: 'cast_id')
  int? get castId;
  @override
  @JsonKey(name: 'character')
  String? get character;
  @override
  @JsonKey(name: 'credit_id')
  String get creditId;
  @override
  @JsonKey(name: 'order')
  int? get order;
  @override
  @JsonKey(name: 'job')
  String? get job;
  @override
  @JsonKey(ignore: true)
  _$$ElencoFilmeImplCopyWith<_$ElencoFilmeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
