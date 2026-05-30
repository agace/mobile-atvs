// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banco_dados.dart';

// ignore_for_file: type=lint
class $FavoritosTable extends Favoritos
    with TableInfo<$FavoritosTable, Favorito> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _movieIdMeta =
      const VerificationMeta('movieId');
  @override
  late final GeneratedColumn<int> movieId = GeneratedColumn<int>(
      'movie_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _favoriteMeta =
      const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<bool> favorite = GeneratedColumn<bool>(
      'favorite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("favorite" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _overviewMeta =
      const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
      'overview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _popularityMeta =
      const VerificationMeta('popularity');
  @override
  late final GeneratedColumn<double> popularity = GeneratedColumn<double>(
      'popularity', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<DateTime> releaseDate = GeneratedColumn<DateTime>(
      'release_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [movieId, image, favorite, title, overview, popularity, releaseDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favoritos';
  @override
  VerificationContext validateIntegrity(Insertable<Favorito> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('movie_id')) {
      context.handle(_movieIdMeta,
          movieId.isAcceptableOrUnknown(data['movie_id']!, _movieIdMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('popularity')) {
      context.handle(
          _popularityMeta,
          popularity.isAcceptableOrUnknown(
              data['popularity']!, _popularityMeta));
    } else if (isInserting) {
      context.missing(_popularityMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {movieId};
  @override
  Favorito map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorito(
      movieId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}movie_id'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      favorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}favorite'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      overview: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}overview'])!,
      popularity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}popularity'])!,
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}release_date'])!,
    );
  }

  @override
  $FavoritosTable createAlias(String alias) {
    return $FavoritosTable(attachedDatabase, alias);
  }
}

class Favorito extends DataClass implements Insertable<Favorito> {
  final int movieId;
  final String image;
  final bool favorite;
  final String title;
  final String overview;
  final double popularity;
  final DateTime releaseDate;
  const Favorito(
      {required this.movieId,
      required this.image,
      required this.favorite,
      required this.title,
      required this.overview,
      required this.popularity,
      required this.releaseDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['movie_id'] = Variable<int>(movieId);
    map['image'] = Variable<String>(image);
    map['favorite'] = Variable<bool>(favorite);
    map['title'] = Variable<String>(title);
    map['overview'] = Variable<String>(overview);
    map['popularity'] = Variable<double>(popularity);
    map['release_date'] = Variable<DateTime>(releaseDate);
    return map;
  }

  FavoritosCompanion toCompanion(bool nullToAbsent) {
    return FavoritosCompanion(
      movieId: Value(movieId),
      image: Value(image),
      favorite: Value(favorite),
      title: Value(title),
      overview: Value(overview),
      popularity: Value(popularity),
      releaseDate: Value(releaseDate),
    );
  }

  factory Favorito.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorito(
      movieId: serializer.fromJson<int>(json['movieId']),
      image: serializer.fromJson<String>(json['image']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      title: serializer.fromJson<String>(json['title']),
      overview: serializer.fromJson<String>(json['overview']),
      popularity: serializer.fromJson<double>(json['popularity']),
      releaseDate: serializer.fromJson<DateTime>(json['releaseDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'movieId': serializer.toJson<int>(movieId),
      'image': serializer.toJson<String>(image),
      'favorite': serializer.toJson<bool>(favorite),
      'title': serializer.toJson<String>(title),
      'overview': serializer.toJson<String>(overview),
      'popularity': serializer.toJson<double>(popularity),
      'releaseDate': serializer.toJson<DateTime>(releaseDate),
    };
  }

  Favorito copyWith(
          {int? movieId,
          String? image,
          bool? favorite,
          String? title,
          String? overview,
          double? popularity,
          DateTime? releaseDate}) =>
      Favorito(
        movieId: movieId ?? this.movieId,
        image: image ?? this.image,
        favorite: favorite ?? this.favorite,
        title: title ?? this.title,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        releaseDate: releaseDate ?? this.releaseDate,
      );
  Favorito copyWithCompanion(FavoritosCompanion data) {
    return Favorito(
      movieId: data.movieId.present ? data.movieId.value : this.movieId,
      image: data.image.present ? data.image.value : this.image,
      favorite: data.favorite.present ? data.favorite.value : this.favorite,
      title: data.title.present ? data.title.value : this.title,
      overview: data.overview.present ? data.overview.value : this.overview,
      popularity:
          data.popularity.present ? data.popularity.value : this.popularity,
      releaseDate:
          data.releaseDate.present ? data.releaseDate.value : this.releaseDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favorito(')
          ..write('movieId: $movieId, ')
          ..write('image: $image, ')
          ..write('favorite: $favorite, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('popularity: $popularity, ')
          ..write('releaseDate: $releaseDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      movieId, image, favorite, title, overview, popularity, releaseDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorito &&
          other.movieId == this.movieId &&
          other.image == this.image &&
          other.favorite == this.favorite &&
          other.title == this.title &&
          other.overview == this.overview &&
          other.popularity == this.popularity &&
          other.releaseDate == this.releaseDate);
}

class FavoritosCompanion extends UpdateCompanion<Favorito> {
  final Value<int> movieId;
  final Value<String> image;
  final Value<bool> favorite;
  final Value<String> title;
  final Value<String> overview;
  final Value<double> popularity;
  final Value<DateTime> releaseDate;
  const FavoritosCompanion({
    this.movieId = const Value.absent(),
    this.image = const Value.absent(),
    this.favorite = const Value.absent(),
    this.title = const Value.absent(),
    this.overview = const Value.absent(),
    this.popularity = const Value.absent(),
    this.releaseDate = const Value.absent(),
  });
  FavoritosCompanion.insert({
    this.movieId = const Value.absent(),
    required String image,
    this.favorite = const Value.absent(),
    required String title,
    required String overview,
    required double popularity,
    required DateTime releaseDate,
  })  : image = Value(image),
        title = Value(title),
        overview = Value(overview),
        popularity = Value(popularity),
        releaseDate = Value(releaseDate);
  static Insertable<Favorito> custom({
    Expression<int>? movieId,
    Expression<String>? image,
    Expression<bool>? favorite,
    Expression<String>? title,
    Expression<String>? overview,
    Expression<double>? popularity,
    Expression<DateTime>? releaseDate,
  }) {
    return RawValuesInsertable({
      if (movieId != null) 'movie_id': movieId,
      if (image != null) 'image': image,
      if (favorite != null) 'favorite': favorite,
      if (title != null) 'title': title,
      if (overview != null) 'overview': overview,
      if (popularity != null) 'popularity': popularity,
      if (releaseDate != null) 'release_date': releaseDate,
    });
  }

  FavoritosCompanion copyWith(
      {Value<int>? movieId,
      Value<String>? image,
      Value<bool>? favorite,
      Value<String>? title,
      Value<String>? overview,
      Value<double>? popularity,
      Value<DateTime>? releaseDate}) {
    return FavoritosCompanion(
      movieId: movieId ?? this.movieId,
      image: image ?? this.image,
      favorite: favorite ?? this.favorite,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (movieId.present) {
      map['movie_id'] = Variable<int>(movieId.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (popularity.present) {
      map['popularity'] = Variable<double>(popularity.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<DateTime>(releaseDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritosCompanion(')
          ..write('movieId: $movieId, ')
          ..write('image: $image, ')
          ..write('favorite: $favorite, ')
          ..write('title: $title, ')
          ..write('overview: $overview, ')
          ..write('popularity: $popularity, ')
          ..write('releaseDate: $releaseDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$BancoDados extends GeneratedDatabase {
  _$BancoDados(QueryExecutor e) : super(e);
  $BancoDadosManager get managers => $BancoDadosManager(this);
  late final $FavoritosTable favoritos = $FavoritosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoritos];
}

typedef $$FavoritosTableCreateCompanionBuilder = FavoritosCompanion Function({
  Value<int> movieId,
  required String image,
  Value<bool> favorite,
  required String title,
  required String overview,
  required double popularity,
  required DateTime releaseDate,
});
typedef $$FavoritosTableUpdateCompanionBuilder = FavoritosCompanion Function({
  Value<int> movieId,
  Value<String> image,
  Value<bool> favorite,
  Value<String> title,
  Value<String> overview,
  Value<double> popularity,
  Value<DateTime> releaseDate,
});

class $$FavoritosTableTableManager extends RootTableManager<
    _$BancoDados,
    $FavoritosTable,
    Favorito,
    $$FavoritosTableFilterComposer,
    $$FavoritosTableOrderingComposer,
    $$FavoritosTableCreateCompanionBuilder,
    $$FavoritosTableUpdateCompanionBuilder> {
  $$FavoritosTableTableManager(_$BancoDados db, $FavoritosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FavoritosTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FavoritosTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> movieId = const Value.absent(),
            Value<String> image = const Value.absent(),
            Value<bool> favorite = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> overview = const Value.absent(),
            Value<double> popularity = const Value.absent(),
            Value<DateTime> releaseDate = const Value.absent(),
          }) =>
              FavoritosCompanion(
            movieId: movieId,
            image: image,
            favorite: favorite,
            title: title,
            overview: overview,
            popularity: popularity,
            releaseDate: releaseDate,
          ),
          createCompanionCallback: ({
            Value<int> movieId = const Value.absent(),
            required String image,
            Value<bool> favorite = const Value.absent(),
            required String title,
            required String overview,
            required double popularity,
            required DateTime releaseDate,
          }) =>
              FavoritosCompanion.insert(
            movieId: movieId,
            image: image,
            favorite: favorite,
            title: title,
            overview: overview,
            popularity: popularity,
            releaseDate: releaseDate,
          ),
        ));
}

class $$FavoritosTableFilterComposer
    extends FilterComposer<_$BancoDados, $FavoritosTable> {
  $$FavoritosTableFilterComposer(super.$state);
  ColumnFilters<int> get movieId => $state.composableBuilder(
      column: $state.table.movieId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get favorite => $state.composableBuilder(
      column: $state.table.favorite,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get overview => $state.composableBuilder(
      column: $state.table.overview,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get popularity => $state.composableBuilder(
      column: $state.table.popularity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get releaseDate => $state.composableBuilder(
      column: $state.table.releaseDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$FavoritosTableOrderingComposer
    extends OrderingComposer<_$BancoDados, $FavoritosTable> {
  $$FavoritosTableOrderingComposer(super.$state);
  ColumnOrderings<int> get movieId => $state.composableBuilder(
      column: $state.table.movieId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get favorite => $state.composableBuilder(
      column: $state.table.favorite,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get overview => $state.composableBuilder(
      column: $state.table.overview,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get popularity => $state.composableBuilder(
      column: $state.table.popularity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get releaseDate => $state.composableBuilder(
      column: $state.table.releaseDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $BancoDadosManager {
  final _$BancoDados _db;
  $BancoDadosManager(this._db);
  $$FavoritosTableTableManager get favoritos =>
      $$FavoritosTableTableManager(_db, _db.favoritos);
}
