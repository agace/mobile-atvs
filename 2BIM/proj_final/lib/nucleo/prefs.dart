import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Prefs(this._prefs);

  final SharedPreferences _prefs;

  static const _chaveTemaEscuro = 'tema_escuro';
  static const _chaveIdioma = 'idioma';

  bool get temaEscuro => _prefs.getBool(_chaveTemaEscuro) ?? false;
  Future<void> definirTemaEscuro(bool valor) =>
      _prefs.setBool(_chaveTemaEscuro, valor);

  String get idioma => _prefs.getString(_chaveIdioma) ?? 'pt';
  Future<void> definirIdioma(String valor) =>
      _prefs.setString(_chaveIdioma, valor);
}
