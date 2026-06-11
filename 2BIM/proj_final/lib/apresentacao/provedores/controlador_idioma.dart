import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../nucleo/prefs.dart';

class ControladorIdioma extends StateNotifier<String> {
  ControladorIdioma(this._prefs) : super(_prefs.idioma);

  final Prefs _prefs;

  Future<void> definir(String idioma) async {
    state = idioma;
    await _prefs.definirIdioma(idioma);
  }
}
