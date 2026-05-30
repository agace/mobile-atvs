import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'banco_dados.g.dart';

// Tabela dos filmes favoritados. A classe de dados gerada chama-se `Favorito`
// (substitui o antigo modelo manual) e cada linha representa um favorito salvo.
@DataClassName('Favorito')
class Favoritos extends Table {
  IntColumn get movieId => integer()();
  TextColumn get image => text()();
  BoolColumn get favorite => boolean().withDefault(const Constant(true))();
  TextColumn get title => text()();
  TextColumn get overview => text()();
  RealColumn get popularity => real()();
  DateTimeColumn get releaseDate => dateTime()();

  @override
  Set<Column> get primaryKey => {movieId};
}

@DriftDatabase(tables: [Favoritos])
class BancoDados extends _$BancoDados {
  BancoDados() : super(_abrirConexao());

  // Construtor usado nos testes, permitindo injetar um banco em memoria.
  BancoDados.paraTeste(super.executor);

  @override
  int get schemaVersion => 1;

  // Observa a lista completa de favoritos. Emite uma nova lista sempre que o
  // banco muda, alimentando a tela de favoritos em tempo real.
  Stream<List<Favorito>> observarFavoritos() => select(favoritos).watch();

  // Insere ou atualiza um favorito (movieId e a chave primaria).
  Future<void> inserirFavorito(Favorito favorito) =>
      into(favoritos).insertOnConflictUpdate(favorito);

  // Remove um favorito pelo id do filme.
  Future<void> removerFavorito(int movieId) =>
      (delete(favoritos)..where((t) => t.movieId.equals(movieId))).go();

  // Observa se um filme especifico esta favoritado (para a tela de detalhes).
  Stream<bool> observarFavorito(int movieId) =>
      (select(favoritos)..where((t) => t.movieId.equals(movieId)))
          .watch()
          .map((linhas) => linhas.isNotEmpty);
}

// Abre o banco SQLite em um arquivo no diretorio de documentos do app.
// A abertura e adiada (LazyDatabase) ate a primeira consulta.
QueryExecutor _abrirConexao() {
  return LazyDatabase(() async {
    final pasta = await getApplicationDocumentsDirectory();
    final arquivo = File(p.join(pasta.path, 'filmes_db.sqlite'));
    return NativeDatabase.createInBackground(arquivo);
  });
}
