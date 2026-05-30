import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:filmes/utilitarios/utilitarios.dart';

// Encapsula o acesso ao SharedPreferences, guardando as preferencias simples
// do app: tema escolhido, ultimo termo de busca e ultimo criterio de ordenacao.
class Prefs {
  final SharedPreferences _sp;

  Prefs(this._sp);

  static const _chaveTema = 'modo_tema';
  static const _chaveUltimaBusca = 'ultima_busca';
  static const _chaveUltimaOrdenacao = 'ultima_ordenacao';

  // ----- Tema -----
  ThemeMode get modoTema {
    switch (_sp.getString(_chaveTema)) {
      case 'claro':
        return ThemeMode.light;
      case 'escuro':
        return ThemeMode.dark;
      default:
        return ThemeMode.dark; // o app inicia em tema escuro por padrao
    }
  }

  Future<void> salvarModoTema(ThemeMode modo) {
    final valor = modo == ThemeMode.light ? 'claro' : 'escuro';
    return _sp.setString(_chaveTema, valor);
  }

  // ----- Ultima busca -----
  String get ultimaBusca => _sp.getString(_chaveUltimaBusca) ?? '';

  Future<void> salvarUltimaBusca(String termo) =>
      _sp.setString(_chaveUltimaBusca, termo);

  // ----- Ultima ordenacao -----
  Sorting get ultimaOrdenacao {
    final nome = _sp.getString(_chaveUltimaOrdenacao);
    return Sorting.values.firstWhere(
      (s) => s.name == nome,
      orElse: () => Sorting.aToz,
    );
  }

  Future<void> salvarUltimaOrdenacao(Sorting ordenacao) =>
      _sp.setString(_chaveUltimaOrdenacao, ordenacao.name);
}
