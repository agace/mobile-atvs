// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banco_local.dart';

// ignore_for_file: type=lint
class $ItensCarrinhoTable extends ItensCarrinho
    with TableInfo<$ItensCarrinhoTable, ItensCarrinhoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItensCarrinhoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _produtoIdMeta = const VerificationMeta(
    'produtoId',
  );
  @override
  late final GeneratedColumn<int> produtoId = GeneratedColumn<int>(
    'produto_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tituloMeta = const VerificationMeta('titulo');
  @override
  late final GeneratedColumn<String> titulo = GeneratedColumn<String>(
    'titulo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _miniaturaMeta = const VerificationMeta(
    'miniatura',
  );
  @override
  late final GeneratedColumn<String> miniatura = GeneratedColumn<String>(
    'miniatura',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _precoUnitarioMeta = const VerificationMeta(
    'precoUnitario',
  );
  @override
  late final GeneratedColumn<double> precoUnitario = GeneratedColumn<double>(
    'preco_unitario',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _percentualDescontoMeta =
      const VerificationMeta('percentualDesconto');
  @override
  late final GeneratedColumn<double> percentualDesconto =
      GeneratedColumn<double>(
        'percentual_desconto',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _quantidadeMeta = const VerificationMeta(
    'quantidade',
  );
  @override
  late final GeneratedColumn<int> quantidade = GeneratedColumn<int>(
    'quantidade',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    produtoId,
    titulo,
    miniatura,
    precoUnitario,
    percentualDesconto,
    quantidade,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'itens_carrinho';
  @override
  VerificationContext validateIntegrity(
    Insertable<ItensCarrinhoData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('produto_id')) {
      context.handle(
        _produtoIdMeta,
        produtoId.isAcceptableOrUnknown(data['produto_id']!, _produtoIdMeta),
      );
    }
    if (data.containsKey('titulo')) {
      context.handle(
        _tituloMeta,
        titulo.isAcceptableOrUnknown(data['titulo']!, _tituloMeta),
      );
    } else if (isInserting) {
      context.missing(_tituloMeta);
    }
    if (data.containsKey('miniatura')) {
      context.handle(
        _miniaturaMeta,
        miniatura.isAcceptableOrUnknown(data['miniatura']!, _miniaturaMeta),
      );
    } else if (isInserting) {
      context.missing(_miniaturaMeta);
    }
    if (data.containsKey('preco_unitario')) {
      context.handle(
        _precoUnitarioMeta,
        precoUnitario.isAcceptableOrUnknown(
          data['preco_unitario']!,
          _precoUnitarioMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_precoUnitarioMeta);
    }
    if (data.containsKey('percentual_desconto')) {
      context.handle(
        _percentualDescontoMeta,
        percentualDesconto.isAcceptableOrUnknown(
          data['percentual_desconto']!,
          _percentualDescontoMeta,
        ),
      );
    }
    if (data.containsKey('quantidade')) {
      context.handle(
        _quantidadeMeta,
        quantidade.isAcceptableOrUnknown(data['quantidade']!, _quantidadeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {produtoId};
  @override
  ItensCarrinhoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItensCarrinhoData(
      produtoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}produto_id'],
      )!,
      titulo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}titulo'],
      )!,
      miniatura: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}miniatura'],
      )!,
      precoUnitario: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}preco_unitario'],
      )!,
      percentualDesconto: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}percentual_desconto'],
      )!,
      quantidade: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantidade'],
      )!,
    );
  }

  @override
  $ItensCarrinhoTable createAlias(String alias) {
    return $ItensCarrinhoTable(attachedDatabase, alias);
  }
}

class ItensCarrinhoData extends DataClass
    implements Insertable<ItensCarrinhoData> {
  final int produtoId;
  final String titulo;
  final String miniatura;
  final double precoUnitario;
  final double percentualDesconto;
  final int quantidade;
  const ItensCarrinhoData({
    required this.produtoId,
    required this.titulo,
    required this.miniatura,
    required this.precoUnitario,
    required this.percentualDesconto,
    required this.quantidade,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['produto_id'] = Variable<int>(produtoId);
    map['titulo'] = Variable<String>(titulo);
    map['miniatura'] = Variable<String>(miniatura);
    map['preco_unitario'] = Variable<double>(precoUnitario);
    map['percentual_desconto'] = Variable<double>(percentualDesconto);
    map['quantidade'] = Variable<int>(quantidade);
    return map;
  }

  ItensCarrinhoCompanion toCompanion(bool nullToAbsent) {
    return ItensCarrinhoCompanion(
      produtoId: Value(produtoId),
      titulo: Value(titulo),
      miniatura: Value(miniatura),
      precoUnitario: Value(precoUnitario),
      percentualDesconto: Value(percentualDesconto),
      quantidade: Value(quantidade),
    );
  }

  factory ItensCarrinhoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItensCarrinhoData(
      produtoId: serializer.fromJson<int>(json['produtoId']),
      titulo: serializer.fromJson<String>(json['titulo']),
      miniatura: serializer.fromJson<String>(json['miniatura']),
      precoUnitario: serializer.fromJson<double>(json['precoUnitario']),
      percentualDesconto: serializer.fromJson<double>(
        json['percentualDesconto'],
      ),
      quantidade: serializer.fromJson<int>(json['quantidade']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'produtoId': serializer.toJson<int>(produtoId),
      'titulo': serializer.toJson<String>(titulo),
      'miniatura': serializer.toJson<String>(miniatura),
      'precoUnitario': serializer.toJson<double>(precoUnitario),
      'percentualDesconto': serializer.toJson<double>(percentualDesconto),
      'quantidade': serializer.toJson<int>(quantidade),
    };
  }

  ItensCarrinhoData copyWith({
    int? produtoId,
    String? titulo,
    String? miniatura,
    double? precoUnitario,
    double? percentualDesconto,
    int? quantidade,
  }) => ItensCarrinhoData(
    produtoId: produtoId ?? this.produtoId,
    titulo: titulo ?? this.titulo,
    miniatura: miniatura ?? this.miniatura,
    precoUnitario: precoUnitario ?? this.precoUnitario,
    percentualDesconto: percentualDesconto ?? this.percentualDesconto,
    quantidade: quantidade ?? this.quantidade,
  );
  ItensCarrinhoData copyWithCompanion(ItensCarrinhoCompanion data) {
    return ItensCarrinhoData(
      produtoId: data.produtoId.present ? data.produtoId.value : this.produtoId,
      titulo: data.titulo.present ? data.titulo.value : this.titulo,
      miniatura: data.miniatura.present ? data.miniatura.value : this.miniatura,
      precoUnitario: data.precoUnitario.present
          ? data.precoUnitario.value
          : this.precoUnitario,
      percentualDesconto: data.percentualDesconto.present
          ? data.percentualDesconto.value
          : this.percentualDesconto,
      quantidade: data.quantidade.present
          ? data.quantidade.value
          : this.quantidade,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItensCarrinhoData(')
          ..write('produtoId: $produtoId, ')
          ..write('titulo: $titulo, ')
          ..write('miniatura: $miniatura, ')
          ..write('precoUnitario: $precoUnitario, ')
          ..write('percentualDesconto: $percentualDesconto, ')
          ..write('quantidade: $quantidade')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    produtoId,
    titulo,
    miniatura,
    precoUnitario,
    percentualDesconto,
    quantidade,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItensCarrinhoData &&
          other.produtoId == this.produtoId &&
          other.titulo == this.titulo &&
          other.miniatura == this.miniatura &&
          other.precoUnitario == this.precoUnitario &&
          other.percentualDesconto == this.percentualDesconto &&
          other.quantidade == this.quantidade);
}

class ItensCarrinhoCompanion extends UpdateCompanion<ItensCarrinhoData> {
  final Value<int> produtoId;
  final Value<String> titulo;
  final Value<String> miniatura;
  final Value<double> precoUnitario;
  final Value<double> percentualDesconto;
  final Value<int> quantidade;
  const ItensCarrinhoCompanion({
    this.produtoId = const Value.absent(),
    this.titulo = const Value.absent(),
    this.miniatura = const Value.absent(),
    this.precoUnitario = const Value.absent(),
    this.percentualDesconto = const Value.absent(),
    this.quantidade = const Value.absent(),
  });
  ItensCarrinhoCompanion.insert({
    this.produtoId = const Value.absent(),
    required String titulo,
    required String miniatura,
    required double precoUnitario,
    this.percentualDesconto = const Value.absent(),
    this.quantidade = const Value.absent(),
  }) : titulo = Value(titulo),
       miniatura = Value(miniatura),
       precoUnitario = Value(precoUnitario);
  static Insertable<ItensCarrinhoData> custom({
    Expression<int>? produtoId,
    Expression<String>? titulo,
    Expression<String>? miniatura,
    Expression<double>? precoUnitario,
    Expression<double>? percentualDesconto,
    Expression<int>? quantidade,
  }) {
    return RawValuesInsertable({
      if (produtoId != null) 'produto_id': produtoId,
      if (titulo != null) 'titulo': titulo,
      if (miniatura != null) 'miniatura': miniatura,
      if (precoUnitario != null) 'preco_unitario': precoUnitario,
      if (percentualDesconto != null) 'percentual_desconto': percentualDesconto,
      if (quantidade != null) 'quantidade': quantidade,
    });
  }

  ItensCarrinhoCompanion copyWith({
    Value<int>? produtoId,
    Value<String>? titulo,
    Value<String>? miniatura,
    Value<double>? precoUnitario,
    Value<double>? percentualDesconto,
    Value<int>? quantidade,
  }) {
    return ItensCarrinhoCompanion(
      produtoId: produtoId ?? this.produtoId,
      titulo: titulo ?? this.titulo,
      miniatura: miniatura ?? this.miniatura,
      precoUnitario: precoUnitario ?? this.precoUnitario,
      percentualDesconto: percentualDesconto ?? this.percentualDesconto,
      quantidade: quantidade ?? this.quantidade,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (produtoId.present) {
      map['produto_id'] = Variable<int>(produtoId.value);
    }
    if (titulo.present) {
      map['titulo'] = Variable<String>(titulo.value);
    }
    if (miniatura.present) {
      map['miniatura'] = Variable<String>(miniatura.value);
    }
    if (precoUnitario.present) {
      map['preco_unitario'] = Variable<double>(precoUnitario.value);
    }
    if (percentualDesconto.present) {
      map['percentual_desconto'] = Variable<double>(percentualDesconto.value);
    }
    if (quantidade.present) {
      map['quantidade'] = Variable<int>(quantidade.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItensCarrinhoCompanion(')
          ..write('produtoId: $produtoId, ')
          ..write('titulo: $titulo, ')
          ..write('miniatura: $miniatura, ')
          ..write('precoUnitario: $precoUnitario, ')
          ..write('percentualDesconto: $percentualDesconto, ')
          ..write('quantidade: $quantidade')
          ..write(')'))
        .toString();
  }
}

class $FavoritosTable extends Favoritos
    with TableInfo<$FavoritosTable, Favorito> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _produtoIdMeta = const VerificationMeta(
    'produtoId',
  );
  @override
  late final GeneratedColumn<int> produtoId = GeneratedColumn<int>(
    'produto_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tituloMeta = const VerificationMeta('titulo');
  @override
  late final GeneratedColumn<String> titulo = GeneratedColumn<String>(
    'titulo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descricaoMeta = const VerificationMeta(
    'descricao',
  );
  @override
  late final GeneratedColumn<String> descricao = GeneratedColumn<String>(
    'descricao',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _categoriaMeta = const VerificationMeta(
    'categoria',
  );
  @override
  late final GeneratedColumn<String> categoria = GeneratedColumn<String>(
    'categoria',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _precoMeta = const VerificationMeta('preco');
  @override
  late final GeneratedColumn<double> preco = GeneratedColumn<double>(
    'preco',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _percentualDescontoMeta =
      const VerificationMeta('percentualDesconto');
  @override
  late final GeneratedColumn<double> percentualDesconto =
      GeneratedColumn<double>(
        'percentual_desconto',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _avaliacaoMeta = const VerificationMeta(
    'avaliacao',
  );
  @override
  late final GeneratedColumn<double> avaliacao = GeneratedColumn<double>(
    'avaliacao',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _estoqueMeta = const VerificationMeta(
    'estoque',
  );
  @override
  late final GeneratedColumn<int> estoque = GeneratedColumn<int>(
    'estoque',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _marcaMeta = const VerificationMeta('marca');
  @override
  late final GeneratedColumn<String> marca = GeneratedColumn<String>(
    'marca',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _miniaturaMeta = const VerificationMeta(
    'miniatura',
  );
  @override
  late final GeneratedColumn<String> miniatura = GeneratedColumn<String>(
    'miniatura',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    produtoId,
    titulo,
    descricao,
    categoria,
    preco,
    percentualDesconto,
    avaliacao,
    estoque,
    marca,
    miniatura,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favoritos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Favorito> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('produto_id')) {
      context.handle(
        _produtoIdMeta,
        produtoId.isAcceptableOrUnknown(data['produto_id']!, _produtoIdMeta),
      );
    }
    if (data.containsKey('titulo')) {
      context.handle(
        _tituloMeta,
        titulo.isAcceptableOrUnknown(data['titulo']!, _tituloMeta),
      );
    } else if (isInserting) {
      context.missing(_tituloMeta);
    }
    if (data.containsKey('descricao')) {
      context.handle(
        _descricaoMeta,
        descricao.isAcceptableOrUnknown(data['descricao']!, _descricaoMeta),
      );
    }
    if (data.containsKey('categoria')) {
      context.handle(
        _categoriaMeta,
        categoria.isAcceptableOrUnknown(data['categoria']!, _categoriaMeta),
      );
    }
    if (data.containsKey('preco')) {
      context.handle(
        _precoMeta,
        preco.isAcceptableOrUnknown(data['preco']!, _precoMeta),
      );
    }
    if (data.containsKey('percentual_desconto')) {
      context.handle(
        _percentualDescontoMeta,
        percentualDesconto.isAcceptableOrUnknown(
          data['percentual_desconto']!,
          _percentualDescontoMeta,
        ),
      );
    }
    if (data.containsKey('avaliacao')) {
      context.handle(
        _avaliacaoMeta,
        avaliacao.isAcceptableOrUnknown(data['avaliacao']!, _avaliacaoMeta),
      );
    }
    if (data.containsKey('estoque')) {
      context.handle(
        _estoqueMeta,
        estoque.isAcceptableOrUnknown(data['estoque']!, _estoqueMeta),
      );
    }
    if (data.containsKey('marca')) {
      context.handle(
        _marcaMeta,
        marca.isAcceptableOrUnknown(data['marca']!, _marcaMeta),
      );
    }
    if (data.containsKey('miniatura')) {
      context.handle(
        _miniaturaMeta,
        miniatura.isAcceptableOrUnknown(data['miniatura']!, _miniaturaMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {produtoId};
  @override
  Favorito map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorito(
      produtoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}produto_id'],
      )!,
      titulo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}titulo'],
      )!,
      descricao: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descricao'],
      )!,
      categoria: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}categoria'],
      )!,
      preco: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}preco'],
      )!,
      percentualDesconto: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}percentual_desconto'],
      )!,
      avaliacao: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}avaliacao'],
      )!,
      estoque: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estoque'],
      )!,
      marca: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}marca'],
      )!,
      miniatura: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}miniatura'],
      )!,
    );
  }

  @override
  $FavoritosTable createAlias(String alias) {
    return $FavoritosTable(attachedDatabase, alias);
  }
}

class Favorito extends DataClass implements Insertable<Favorito> {
  final int produtoId;
  final String titulo;
  final String descricao;
  final String categoria;
  final double preco;
  final double percentualDesconto;
  final double avaliacao;
  final int estoque;
  final String marca;
  final String miniatura;
  const Favorito({
    required this.produtoId,
    required this.titulo,
    required this.descricao,
    required this.categoria,
    required this.preco,
    required this.percentualDesconto,
    required this.avaliacao,
    required this.estoque,
    required this.marca,
    required this.miniatura,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['produto_id'] = Variable<int>(produtoId);
    map['titulo'] = Variable<String>(titulo);
    map['descricao'] = Variable<String>(descricao);
    map['categoria'] = Variable<String>(categoria);
    map['preco'] = Variable<double>(preco);
    map['percentual_desconto'] = Variable<double>(percentualDesconto);
    map['avaliacao'] = Variable<double>(avaliacao);
    map['estoque'] = Variable<int>(estoque);
    map['marca'] = Variable<String>(marca);
    map['miniatura'] = Variable<String>(miniatura);
    return map;
  }

  FavoritosCompanion toCompanion(bool nullToAbsent) {
    return FavoritosCompanion(
      produtoId: Value(produtoId),
      titulo: Value(titulo),
      descricao: Value(descricao),
      categoria: Value(categoria),
      preco: Value(preco),
      percentualDesconto: Value(percentualDesconto),
      avaliacao: Value(avaliacao),
      estoque: Value(estoque),
      marca: Value(marca),
      miniatura: Value(miniatura),
    );
  }

  factory Favorito.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorito(
      produtoId: serializer.fromJson<int>(json['produtoId']),
      titulo: serializer.fromJson<String>(json['titulo']),
      descricao: serializer.fromJson<String>(json['descricao']),
      categoria: serializer.fromJson<String>(json['categoria']),
      preco: serializer.fromJson<double>(json['preco']),
      percentualDesconto: serializer.fromJson<double>(
        json['percentualDesconto'],
      ),
      avaliacao: serializer.fromJson<double>(json['avaliacao']),
      estoque: serializer.fromJson<int>(json['estoque']),
      marca: serializer.fromJson<String>(json['marca']),
      miniatura: serializer.fromJson<String>(json['miniatura']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'produtoId': serializer.toJson<int>(produtoId),
      'titulo': serializer.toJson<String>(titulo),
      'descricao': serializer.toJson<String>(descricao),
      'categoria': serializer.toJson<String>(categoria),
      'preco': serializer.toJson<double>(preco),
      'percentualDesconto': serializer.toJson<double>(percentualDesconto),
      'avaliacao': serializer.toJson<double>(avaliacao),
      'estoque': serializer.toJson<int>(estoque),
      'marca': serializer.toJson<String>(marca),
      'miniatura': serializer.toJson<String>(miniatura),
    };
  }

  Favorito copyWith({
    int? produtoId,
    String? titulo,
    String? descricao,
    String? categoria,
    double? preco,
    double? percentualDesconto,
    double? avaliacao,
    int? estoque,
    String? marca,
    String? miniatura,
  }) => Favorito(
    produtoId: produtoId ?? this.produtoId,
    titulo: titulo ?? this.titulo,
    descricao: descricao ?? this.descricao,
    categoria: categoria ?? this.categoria,
    preco: preco ?? this.preco,
    percentualDesconto: percentualDesconto ?? this.percentualDesconto,
    avaliacao: avaliacao ?? this.avaliacao,
    estoque: estoque ?? this.estoque,
    marca: marca ?? this.marca,
    miniatura: miniatura ?? this.miniatura,
  );
  Favorito copyWithCompanion(FavoritosCompanion data) {
    return Favorito(
      produtoId: data.produtoId.present ? data.produtoId.value : this.produtoId,
      titulo: data.titulo.present ? data.titulo.value : this.titulo,
      descricao: data.descricao.present ? data.descricao.value : this.descricao,
      categoria: data.categoria.present ? data.categoria.value : this.categoria,
      preco: data.preco.present ? data.preco.value : this.preco,
      percentualDesconto: data.percentualDesconto.present
          ? data.percentualDesconto.value
          : this.percentualDesconto,
      avaliacao: data.avaliacao.present ? data.avaliacao.value : this.avaliacao,
      estoque: data.estoque.present ? data.estoque.value : this.estoque,
      marca: data.marca.present ? data.marca.value : this.marca,
      miniatura: data.miniatura.present ? data.miniatura.value : this.miniatura,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favorito(')
          ..write('produtoId: $produtoId, ')
          ..write('titulo: $titulo, ')
          ..write('descricao: $descricao, ')
          ..write('categoria: $categoria, ')
          ..write('preco: $preco, ')
          ..write('percentualDesconto: $percentualDesconto, ')
          ..write('avaliacao: $avaliacao, ')
          ..write('estoque: $estoque, ')
          ..write('marca: $marca, ')
          ..write('miniatura: $miniatura')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    produtoId,
    titulo,
    descricao,
    categoria,
    preco,
    percentualDesconto,
    avaliacao,
    estoque,
    marca,
    miniatura,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorito &&
          other.produtoId == this.produtoId &&
          other.titulo == this.titulo &&
          other.descricao == this.descricao &&
          other.categoria == this.categoria &&
          other.preco == this.preco &&
          other.percentualDesconto == this.percentualDesconto &&
          other.avaliacao == this.avaliacao &&
          other.estoque == this.estoque &&
          other.marca == this.marca &&
          other.miniatura == this.miniatura);
}

class FavoritosCompanion extends UpdateCompanion<Favorito> {
  final Value<int> produtoId;
  final Value<String> titulo;
  final Value<String> descricao;
  final Value<String> categoria;
  final Value<double> preco;
  final Value<double> percentualDesconto;
  final Value<double> avaliacao;
  final Value<int> estoque;
  final Value<String> marca;
  final Value<String> miniatura;
  const FavoritosCompanion({
    this.produtoId = const Value.absent(),
    this.titulo = const Value.absent(),
    this.descricao = const Value.absent(),
    this.categoria = const Value.absent(),
    this.preco = const Value.absent(),
    this.percentualDesconto = const Value.absent(),
    this.avaliacao = const Value.absent(),
    this.estoque = const Value.absent(),
    this.marca = const Value.absent(),
    this.miniatura = const Value.absent(),
  });
  FavoritosCompanion.insert({
    this.produtoId = const Value.absent(),
    required String titulo,
    this.descricao = const Value.absent(),
    this.categoria = const Value.absent(),
    this.preco = const Value.absent(),
    this.percentualDesconto = const Value.absent(),
    this.avaliacao = const Value.absent(),
    this.estoque = const Value.absent(),
    this.marca = const Value.absent(),
    this.miniatura = const Value.absent(),
  }) : titulo = Value(titulo);
  static Insertable<Favorito> custom({
    Expression<int>? produtoId,
    Expression<String>? titulo,
    Expression<String>? descricao,
    Expression<String>? categoria,
    Expression<double>? preco,
    Expression<double>? percentualDesconto,
    Expression<double>? avaliacao,
    Expression<int>? estoque,
    Expression<String>? marca,
    Expression<String>? miniatura,
  }) {
    return RawValuesInsertable({
      if (produtoId != null) 'produto_id': produtoId,
      if (titulo != null) 'titulo': titulo,
      if (descricao != null) 'descricao': descricao,
      if (categoria != null) 'categoria': categoria,
      if (preco != null) 'preco': preco,
      if (percentualDesconto != null) 'percentual_desconto': percentualDesconto,
      if (avaliacao != null) 'avaliacao': avaliacao,
      if (estoque != null) 'estoque': estoque,
      if (marca != null) 'marca': marca,
      if (miniatura != null) 'miniatura': miniatura,
    });
  }

  FavoritosCompanion copyWith({
    Value<int>? produtoId,
    Value<String>? titulo,
    Value<String>? descricao,
    Value<String>? categoria,
    Value<double>? preco,
    Value<double>? percentualDesconto,
    Value<double>? avaliacao,
    Value<int>? estoque,
    Value<String>? marca,
    Value<String>? miniatura,
  }) {
    return FavoritosCompanion(
      produtoId: produtoId ?? this.produtoId,
      titulo: titulo ?? this.titulo,
      descricao: descricao ?? this.descricao,
      categoria: categoria ?? this.categoria,
      preco: preco ?? this.preco,
      percentualDesconto: percentualDesconto ?? this.percentualDesconto,
      avaliacao: avaliacao ?? this.avaliacao,
      estoque: estoque ?? this.estoque,
      marca: marca ?? this.marca,
      miniatura: miniatura ?? this.miniatura,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (produtoId.present) {
      map['produto_id'] = Variable<int>(produtoId.value);
    }
    if (titulo.present) {
      map['titulo'] = Variable<String>(titulo.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    if (categoria.present) {
      map['categoria'] = Variable<String>(categoria.value);
    }
    if (preco.present) {
      map['preco'] = Variable<double>(preco.value);
    }
    if (percentualDesconto.present) {
      map['percentual_desconto'] = Variable<double>(percentualDesconto.value);
    }
    if (avaliacao.present) {
      map['avaliacao'] = Variable<double>(avaliacao.value);
    }
    if (estoque.present) {
      map['estoque'] = Variable<int>(estoque.value);
    }
    if (marca.present) {
      map['marca'] = Variable<String>(marca.value);
    }
    if (miniatura.present) {
      map['miniatura'] = Variable<String>(miniatura.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritosCompanion(')
          ..write('produtoId: $produtoId, ')
          ..write('titulo: $titulo, ')
          ..write('descricao: $descricao, ')
          ..write('categoria: $categoria, ')
          ..write('preco: $preco, ')
          ..write('percentualDesconto: $percentualDesconto, ')
          ..write('avaliacao: $avaliacao, ')
          ..write('estoque: $estoque, ')
          ..write('marca: $marca, ')
          ..write('miniatura: $miniatura')
          ..write(')'))
        .toString();
  }
}

abstract class _$BancoLocal extends GeneratedDatabase {
  _$BancoLocal(QueryExecutor e) : super(e);
  $BancoLocalManager get managers => $BancoLocalManager(this);
  late final $ItensCarrinhoTable itensCarrinho = $ItensCarrinhoTable(this);
  late final $FavoritosTable favoritos = $FavoritosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    itensCarrinho,
    favoritos,
  ];
}

typedef $$ItensCarrinhoTableCreateCompanionBuilder =
    ItensCarrinhoCompanion Function({
      Value<int> produtoId,
      required String titulo,
      required String miniatura,
      required double precoUnitario,
      Value<double> percentualDesconto,
      Value<int> quantidade,
    });
typedef $$ItensCarrinhoTableUpdateCompanionBuilder =
    ItensCarrinhoCompanion Function({
      Value<int> produtoId,
      Value<String> titulo,
      Value<String> miniatura,
      Value<double> precoUnitario,
      Value<double> percentualDesconto,
      Value<int> quantidade,
    });

class $$ItensCarrinhoTableFilterComposer
    extends Composer<_$BancoLocal, $ItensCarrinhoTable> {
  $$ItensCarrinhoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get produtoId => $composableBuilder(
    column: $table.produtoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titulo => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get miniatura => $composableBuilder(
    column: $table.miniatura,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get precoUnitario => $composableBuilder(
    column: $table.precoUnitario,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get percentualDesconto => $composableBuilder(
    column: $table.percentualDesconto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantidade => $composableBuilder(
    column: $table.quantidade,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ItensCarrinhoTableOrderingComposer
    extends Composer<_$BancoLocal, $ItensCarrinhoTable> {
  $$ItensCarrinhoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get produtoId => $composableBuilder(
    column: $table.produtoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titulo => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get miniatura => $composableBuilder(
    column: $table.miniatura,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get precoUnitario => $composableBuilder(
    column: $table.precoUnitario,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get percentualDesconto => $composableBuilder(
    column: $table.percentualDesconto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantidade => $composableBuilder(
    column: $table.quantidade,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ItensCarrinhoTableAnnotationComposer
    extends Composer<_$BancoLocal, $ItensCarrinhoTable> {
  $$ItensCarrinhoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get produtoId =>
      $composableBuilder(column: $table.produtoId, builder: (column) => column);

  GeneratedColumn<String> get titulo =>
      $composableBuilder(column: $table.titulo, builder: (column) => column);

  GeneratedColumn<String> get miniatura =>
      $composableBuilder(column: $table.miniatura, builder: (column) => column);

  GeneratedColumn<double> get precoUnitario => $composableBuilder(
    column: $table.precoUnitario,
    builder: (column) => column,
  );

  GeneratedColumn<double> get percentualDesconto => $composableBuilder(
    column: $table.percentualDesconto,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quantidade => $composableBuilder(
    column: $table.quantidade,
    builder: (column) => column,
  );
}

class $$ItensCarrinhoTableTableManager
    extends
        RootTableManager<
          _$BancoLocal,
          $ItensCarrinhoTable,
          ItensCarrinhoData,
          $$ItensCarrinhoTableFilterComposer,
          $$ItensCarrinhoTableOrderingComposer,
          $$ItensCarrinhoTableAnnotationComposer,
          $$ItensCarrinhoTableCreateCompanionBuilder,
          $$ItensCarrinhoTableUpdateCompanionBuilder,
          (
            ItensCarrinhoData,
            BaseReferences<
              _$BancoLocal,
              $ItensCarrinhoTable,
              ItensCarrinhoData
            >,
          ),
          ItensCarrinhoData,
          PrefetchHooks Function()
        > {
  $$ItensCarrinhoTableTableManager(_$BancoLocal db, $ItensCarrinhoTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItensCarrinhoTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItensCarrinhoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItensCarrinhoTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> produtoId = const Value.absent(),
                Value<String> titulo = const Value.absent(),
                Value<String> miniatura = const Value.absent(),
                Value<double> precoUnitario = const Value.absent(),
                Value<double> percentualDesconto = const Value.absent(),
                Value<int> quantidade = const Value.absent(),
              }) => ItensCarrinhoCompanion(
                produtoId: produtoId,
                titulo: titulo,
                miniatura: miniatura,
                precoUnitario: precoUnitario,
                percentualDesconto: percentualDesconto,
                quantidade: quantidade,
              ),
          createCompanionCallback:
              ({
                Value<int> produtoId = const Value.absent(),
                required String titulo,
                required String miniatura,
                required double precoUnitario,
                Value<double> percentualDesconto = const Value.absent(),
                Value<int> quantidade = const Value.absent(),
              }) => ItensCarrinhoCompanion.insert(
                produtoId: produtoId,
                titulo: titulo,
                miniatura: miniatura,
                precoUnitario: precoUnitario,
                percentualDesconto: percentualDesconto,
                quantidade: quantidade,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ItensCarrinhoTableProcessedTableManager =
    ProcessedTableManager<
      _$BancoLocal,
      $ItensCarrinhoTable,
      ItensCarrinhoData,
      $$ItensCarrinhoTableFilterComposer,
      $$ItensCarrinhoTableOrderingComposer,
      $$ItensCarrinhoTableAnnotationComposer,
      $$ItensCarrinhoTableCreateCompanionBuilder,
      $$ItensCarrinhoTableUpdateCompanionBuilder,
      (
        ItensCarrinhoData,
        BaseReferences<_$BancoLocal, $ItensCarrinhoTable, ItensCarrinhoData>,
      ),
      ItensCarrinhoData,
      PrefetchHooks Function()
    >;
typedef $$FavoritosTableCreateCompanionBuilder =
    FavoritosCompanion Function({
      Value<int> produtoId,
      required String titulo,
      Value<String> descricao,
      Value<String> categoria,
      Value<double> preco,
      Value<double> percentualDesconto,
      Value<double> avaliacao,
      Value<int> estoque,
      Value<String> marca,
      Value<String> miniatura,
    });
typedef $$FavoritosTableUpdateCompanionBuilder =
    FavoritosCompanion Function({
      Value<int> produtoId,
      Value<String> titulo,
      Value<String> descricao,
      Value<String> categoria,
      Value<double> preco,
      Value<double> percentualDesconto,
      Value<double> avaliacao,
      Value<int> estoque,
      Value<String> marca,
      Value<String> miniatura,
    });

class $$FavoritosTableFilterComposer
    extends Composer<_$BancoLocal, $FavoritosTable> {
  $$FavoritosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get produtoId => $composableBuilder(
    column: $table.produtoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titulo => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descricao => $composableBuilder(
    column: $table.descricao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoria => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get preco => $composableBuilder(
    column: $table.preco,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get percentualDesconto => $composableBuilder(
    column: $table.percentualDesconto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get avaliacao => $composableBuilder(
    column: $table.avaliacao,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estoque => $composableBuilder(
    column: $table.estoque,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get marca => $composableBuilder(
    column: $table.marca,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get miniatura => $composableBuilder(
    column: $table.miniatura,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoritosTableOrderingComposer
    extends Composer<_$BancoLocal, $FavoritosTable> {
  $$FavoritosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get produtoId => $composableBuilder(
    column: $table.produtoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titulo => $composableBuilder(
    column: $table.titulo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descricao => $composableBuilder(
    column: $table.descricao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoria => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get preco => $composableBuilder(
    column: $table.preco,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get percentualDesconto => $composableBuilder(
    column: $table.percentualDesconto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get avaliacao => $composableBuilder(
    column: $table.avaliacao,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estoque => $composableBuilder(
    column: $table.estoque,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get marca => $composableBuilder(
    column: $table.marca,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get miniatura => $composableBuilder(
    column: $table.miniatura,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoritosTableAnnotationComposer
    extends Composer<_$BancoLocal, $FavoritosTable> {
  $$FavoritosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get produtoId =>
      $composableBuilder(column: $table.produtoId, builder: (column) => column);

  GeneratedColumn<String> get titulo =>
      $composableBuilder(column: $table.titulo, builder: (column) => column);

  GeneratedColumn<String> get descricao =>
      $composableBuilder(column: $table.descricao, builder: (column) => column);

  GeneratedColumn<String> get categoria =>
      $composableBuilder(column: $table.categoria, builder: (column) => column);

  GeneratedColumn<double> get preco =>
      $composableBuilder(column: $table.preco, builder: (column) => column);

  GeneratedColumn<double> get percentualDesconto => $composableBuilder(
    column: $table.percentualDesconto,
    builder: (column) => column,
  );

  GeneratedColumn<double> get avaliacao =>
      $composableBuilder(column: $table.avaliacao, builder: (column) => column);

  GeneratedColumn<int> get estoque =>
      $composableBuilder(column: $table.estoque, builder: (column) => column);

  GeneratedColumn<String> get marca =>
      $composableBuilder(column: $table.marca, builder: (column) => column);

  GeneratedColumn<String> get miniatura =>
      $composableBuilder(column: $table.miniatura, builder: (column) => column);
}

class $$FavoritosTableTableManager
    extends
        RootTableManager<
          _$BancoLocal,
          $FavoritosTable,
          Favorito,
          $$FavoritosTableFilterComposer,
          $$FavoritosTableOrderingComposer,
          $$FavoritosTableAnnotationComposer,
          $$FavoritosTableCreateCompanionBuilder,
          $$FavoritosTableUpdateCompanionBuilder,
          (Favorito, BaseReferences<_$BancoLocal, $FavoritosTable, Favorito>),
          Favorito,
          PrefetchHooks Function()
        > {
  $$FavoritosTableTableManager(_$BancoLocal db, $FavoritosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> produtoId = const Value.absent(),
                Value<String> titulo = const Value.absent(),
                Value<String> descricao = const Value.absent(),
                Value<String> categoria = const Value.absent(),
                Value<double> preco = const Value.absent(),
                Value<double> percentualDesconto = const Value.absent(),
                Value<double> avaliacao = const Value.absent(),
                Value<int> estoque = const Value.absent(),
                Value<String> marca = const Value.absent(),
                Value<String> miniatura = const Value.absent(),
              }) => FavoritosCompanion(
                produtoId: produtoId,
                titulo: titulo,
                descricao: descricao,
                categoria: categoria,
                preco: preco,
                percentualDesconto: percentualDesconto,
                avaliacao: avaliacao,
                estoque: estoque,
                marca: marca,
                miniatura: miniatura,
              ),
          createCompanionCallback:
              ({
                Value<int> produtoId = const Value.absent(),
                required String titulo,
                Value<String> descricao = const Value.absent(),
                Value<String> categoria = const Value.absent(),
                Value<double> preco = const Value.absent(),
                Value<double> percentualDesconto = const Value.absent(),
                Value<double> avaliacao = const Value.absent(),
                Value<int> estoque = const Value.absent(),
                Value<String> marca = const Value.absent(),
                Value<String> miniatura = const Value.absent(),
              }) => FavoritosCompanion.insert(
                produtoId: produtoId,
                titulo: titulo,
                descricao: descricao,
                categoria: categoria,
                preco: preco,
                percentualDesconto: percentualDesconto,
                avaliacao: avaliacao,
                estoque: estoque,
                marca: marca,
                miniatura: miniatura,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoritosTableProcessedTableManager =
    ProcessedTableManager<
      _$BancoLocal,
      $FavoritosTable,
      Favorito,
      $$FavoritosTableFilterComposer,
      $$FavoritosTableOrderingComposer,
      $$FavoritosTableAnnotationComposer,
      $$FavoritosTableCreateCompanionBuilder,
      $$FavoritosTableUpdateCompanionBuilder,
      (Favorito, BaseReferences<_$BancoLocal, $FavoritosTable, Favorito>),
      Favorito,
      PrefetchHooks Function()
    >;

class $BancoLocalManager {
  final _$BancoLocal _db;
  $BancoLocalManager(this._db);
  $$ItensCarrinhoTableTableManager get itensCarrinho =>
      $$ItensCarrinhoTableTableManager(_db, _db.itensCarrinho);
  $$FavoritosTableTableManager get favoritos =>
      $$FavoritosTableTableManager(_db, _db.favoritos);
}
