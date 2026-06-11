import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dominio/entidades/notificacao.dart';

class ControladorNotificacoes extends StateNotifier<List<Notificacao>> {
  ControladorNotificacoes() : super(const []);

  void adicionar({required String titulo, required String mensagem}) {
    final agora = DateTime.now();
    final nova = Notificacao(
      id: agora.microsecondsSinceEpoch.toString(),
      titulo: titulo,
      mensagem: mensagem,
      criadaEm: agora,
    );
    state = [nova, ...state];
  }

  void marcarTodasComoLidas() {
    if (state.every((n) => n.lida)) return;
    state = [for (final n in state) n.copyWith(lida: true)];
  }

  void limpar() => state = const [];
}
