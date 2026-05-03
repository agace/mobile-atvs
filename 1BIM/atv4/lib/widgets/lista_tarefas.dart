import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/tarefas_provider.dart';
import 'item_tarefa.dart';

class ListaTarefas extends ConsumerWidget {
  const ListaTarefas({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tarefas = ref.watch(tarefasProvider);

    if (tarefas.isEmpty) {
      return Expanded(
        child: Center(
          child: Text(
            'Sem tarefas por enquanto.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.2),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 8, bottom: 40),
        physics: const BouncingScrollPhysics(),
        itemCount: tarefas.length,
        itemBuilder: (context, index) {
          return ItemTarefa(tarefa: tarefas[index]);
        },
      ),
    );
  }
}
