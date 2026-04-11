import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/tarefas_provider.dart';
import 'widgets/campo_nova_tarefa.dart';
import 'widgets/lista_tarefas.dart';

class TarefasPage extends ConsumerWidget {
  const TarefasPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tarefas = ref.watch(tarefasProvider);
    final concluidas = tarefas.where((t) => t.concluida).length;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Tarefas',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.95),
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1.0,
                    ),
                  ),
                  const Spacer(),
                  if (tarefas.isNotEmpty)
                    Text(
                      '$concluidas/${tarefas.length}',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.3),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const CampoNovaTarefa(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Container(
                height: 0.5,
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
            const SizedBox(height: 8),
            const ListaTarefas(),
          ],
        ),
      ),
    );
  }
}
