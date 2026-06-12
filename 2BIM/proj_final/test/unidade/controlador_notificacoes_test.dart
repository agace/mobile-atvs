import 'package:flutter_test/flutter_test.dart';
import 'package:loja/apresentacao/provedores/controlador_notificacoes.dart';

void main() {
  group('ControladorNotificacoes', () {
    test('adicionar insere no topo e marca como nao lida', () {
      final controlador = ControladorNotificacoes();

      controlador.adicionar(titulo: 'Primeira', mensagem: 'a');
      controlador.adicionar(titulo: 'Segunda', mensagem: 'b');

      expect(controlador.state.length, 2);
      expect(controlador.state.first.titulo, 'Segunda');
      expect(controlador.state.every((n) => !n.lida), isTrue);
    });

    test('marcarTodasComoLidas zera as nao lidas', () {
      final controlador = ControladorNotificacoes()
        ..adicionar(titulo: 'x', mensagem: 'y');

      controlador.marcarTodasComoLidas();

      expect(controlador.state.single.lida, isTrue);
      expect(controlador.state.where((n) => !n.lida), isEmpty);
    });

    test('limpar remove todas as notificacoes', () {
      final controlador = ControladorNotificacoes()
        ..adicionar(titulo: 'x', mensagem: 'y');

      controlador.limpar();

      expect(controlador.state, isEmpty);
    });
  });
}
