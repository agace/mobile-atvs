import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'banco_local.g.dart';

class ItensCarrinho extends Table {
  IntColumn get produtoId => integer()();
  TextColumn get titulo => text()();
  TextColumn get miniatura => text()();
  RealColumn get precoUnitario => real()();
  RealColumn get percentualDesconto => real().withDefault(const Constant(0))();
  IntColumn get quantidade => integer().withDefault(const Constant(1))();

  @override
  Set<Column> get primaryKey => {produtoId};
}

class Favoritos extends Table {
  IntColumn get produtoId => integer()();
  TextColumn get titulo => text()();
  TextColumn get descricao => text().withDefault(const Constant(''))();
  TextColumn get categoria => text().withDefault(const Constant(''))();
  RealColumn get preco => real().withDefault(const Constant(0))();
  RealColumn get percentualDesconto => real().withDefault(const Constant(0))();
  RealColumn get avaliacao => real().withDefault(const Constant(0))();
  IntColumn get estoque => integer().withDefault(const Constant(0))();
  TextColumn get marca => text().withDefault(const Constant(''))();
  TextColumn get miniatura => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {produtoId};
}

@DriftDatabase(tables: [ItensCarrinho, Favoritos])
class BancoLocal extends _$BancoLocal {
  BancoLocal() : super(_abrirConexao());

  BancoLocal.paraTeste(super.executor);

  @override
  int get schemaVersion => 1;
}

LazyDatabase _abrirConexao() {
  return LazyDatabase(() async {
    final pasta = await getApplicationDocumentsDirectory();
    final arquivo = File(p.join(pasta.path, 'loja.sqlite'));
    return NativeDatabase.createInBackground(arquivo);
  });
}
