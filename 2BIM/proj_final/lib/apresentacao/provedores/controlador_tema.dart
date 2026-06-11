import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../nucleo/prefs.dart';

class ControladorTema extends StateNotifier<bool> {
  ControladorTema(this._prefs) : super(_prefs.temaEscuro);

  final Prefs _prefs;

  Future<void> alternar() async {
    state = !state;
    await _prefs.definirTemaEscuro(state);
  }
}
