import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tarefa.dart';

class TarefasNotifier extends Notifier<List<Tarefa>> {
  @override
  List<Tarefa> build() => [];

  void adicionar(String titulo) {
    final tarefa = Tarefa(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      titulo: titulo,
    );
    state = [...state, tarefa];
  }

  void alternarConclusao(String id) {
    state = state.map((tarefa) {
      if (tarefa.id == id) {
        return tarefa.copiarCom(concluida: !tarefa.concluida);
      }
      return tarefa;
    }).toList();
  }

  void remover(String id) {
    state = state.where((tarefa) => tarefa.id != id).toList();
  }
}

final tarefasProvider = NotifierProvider<TarefasNotifier, List<Tarefa>>(
  TarefasNotifier.new,
);
