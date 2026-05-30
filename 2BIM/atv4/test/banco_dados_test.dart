import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:filmes/dados/banco/banco_dados.dart';

void main() {
  late BancoDados banco;

  Favorito filmeExemplo(int id) => Favorito(
        movieId: id,
        image: 'http://image.tmdb.org/t/p/w780/exemplo.jpg',
        favorite: true,
        title: 'Filme $id',
        overview: 'Sinopse $id',
        popularity: 10.0,
        releaseDate: DateTime(2020, 1, 1),
      );

  setUp(() {
    banco = BancoDados.paraTeste(NativeDatabase.memory());
  });

  tearDown(() async {
    await banco.close();
  });

  test('inicia sem favoritos', () async {
    expect(await banco.observarFavoritos().first, isEmpty);
  });

  test('insere e lista favorito', () async {
    await banco.inserirFavorito(filmeExemplo(1));
    final favoritos = await banco.observarFavoritos().first;
    expect(favoritos, hasLength(1));
    expect(favoritos.first.title, 'Filme 1');
  });

  test('remove favorito do banco', () async {
    await banco.inserirFavorito(filmeExemplo(1));
    await banco.removerFavorito(1);
    expect(await banco.observarFavoritos().first, isEmpty);
  });

  test('observarFavorito reflete o estado do filme', () async {
    expect(await banco.observarFavorito(1).first, isFalse);
    await banco.inserirFavorito(filmeExemplo(1));
    expect(await banco.observarFavorito(1).first, isTrue);
  });
}
