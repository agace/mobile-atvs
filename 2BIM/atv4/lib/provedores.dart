import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:filmes/dados/banco/banco_dados.dart';
import 'package:filmes/rede/servico_api_filmes.dart';
import 'package:filmes/roteador/rotas_app.dart';
import 'package:filmes/ui/viewmodel_filmes.dart';
import 'package:filmes/utilitarios/prefs.dart';

part 'provedores.g.dart';

@Riverpod(keepAlive: true)
ServicoApiFilmes servicoApiFilmes(ServicoApiFilmesRef ref) => ServicoApiFilmes();

// Banco local (Drift/SQLite) com os filmes favoritados.
final bancoDadosProvider = Provider<BancoDados>((ref) {
  final banco = BancoDados();
  ref.onDispose(banco.close);
  return banco;
});

// SharedPreferences. O valor real e injetado no main() via override, depois de
// `SharedPreferences.getInstance()`.
final prefsProvider = Provider<Prefs>((ref) {
  throw UnimplementedError('prefsProvider precisa ser sobrescrito no main()');
});

// Controla o tema atual (claro/escuro) e persiste a escolha no SharedPreferences.
class ControladorTema extends StateNotifier<ThemeMode> {
  final Prefs prefs;

  ControladorTema(this.prefs) : super(prefs.modoTema);

  Future<void> definir(ThemeMode modo) async {
    state = modo;
    await prefs.salvarModoTema(modo);
  }

  Future<void> alternar() => definir(
        state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
      );
}

final controladorTemaProvider =
    StateNotifierProvider<ControladorTema, ThemeMode>((ref) {
  return ControladorTema(ref.watch(prefsProvider));
});

@Riverpod(keepAlive: true)
Future<ViewModelFilmes> viewModelFilmes(ViewModelFilmesRef ref) async {
  final model = ViewModelFilmes(
    servicoApiFilmes: ref.read(servicoApiFilmesProvider),
    banco: ref.read(bancoDadosProvider),
  );
  await model.configurar();
  return model;
}

final tagHeroProvider = StateProvider<String>((ref) {
  return '';
});

@Riverpod(keepAlive: true)
RoteadorApp roteadorApp(RoteadorAppRef ref) => RoteadorApp();
