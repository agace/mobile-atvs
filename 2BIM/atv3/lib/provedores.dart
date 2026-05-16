import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:filmes/rede/servico_api_filmes.dart';
import 'package:filmes/roteador/rotas_app.dart';
import 'package:filmes/ui/viewmodel_filmes.dart';

part 'provedores.g.dart';

@Riverpod(keepAlive: true)
ServicoApiFilmes servicoApiFilmes(ServicoApiFilmesRef ref) => ServicoApiFilmes();

@Riverpod(keepAlive: true)
Future<ViewModelFilmes> viewModelFilmes(ViewModelFilmesRef ref) async {
  final model = ViewModelFilmes(servicoApiFilmes: ref.read(servicoApiFilmesProvider));
  await model.configurar();
  return model;
}


final tagHeroProvider = StateProvider<String>((ref) {
  return '';
});


@Riverpod(keepAlive: true)
RoteadorApp roteadorApp(RoteadorAppRef ref) => RoteadorApp();

