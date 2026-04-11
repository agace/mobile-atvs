import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tarefa.dart';
import '../providers/tarefas_provider.dart';

class ItemTarefa extends ConsumerStatefulWidget {
  final Tarefa tarefa;

  const ItemTarefa({super.key, required this.tarefa});

  @override
  ConsumerState<ItemTarefa> createState() => _ItemTarefaState();
}

class _ItemTarefaState extends ConsumerState<ItemTarefa> {
  bool _hoverLixeira = false;

  @override
  Widget build(BuildContext context) {
    final tarefa = widget.tarefa;

    return Dismissible(
      key: Key(tarefa.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        ref.read(tarefasProvider.notifier).remover(tarefa.id);
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 32),
        child: Icon(
          Icons.delete_outline,
          color: Colors.red.shade300,
          size: 20,
        ),
      ),
      child: InkWell(
        onTap: () {
          ref.read(tarefasProvider.notifier).alternarConclusao(tarefa.id);
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.white.withValues(alpha: 0.03),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withValues(alpha: 0.04),
              ),
            ),
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: tarefa.concluida
                      ? Colors.white.withValues(alpha: 0.9)
                      : Colors.transparent,
                  border: Border.all(
                    color: tarefa.concluida
                        ? Colors.white.withValues(alpha: 0.9)
                        : Colors.white.withValues(alpha: 0.15),
                    width: 1.5,
                  ),
                ),
                child: tarefa.concluida
                    ? const Icon(
                        Icons.check,
                        size: 14,
                        color: Color(0xFF121212),
                      )
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  tarefa.titulo,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: tarefa.concluida
                        ? Colors.white.withValues(alpha: 0.2)
                        : Colors.white.withValues(alpha: 0.85),
                    decoration:
                        tarefa.concluida ? TextDecoration.lineThrough : null,
                    decorationColor: Colors.white.withValues(alpha: 0.2),
                    letterSpacing: 0.1,
                  ),
                ),
              ),
              MouseRegion(
                onEnter: (_) => setState(() => _hoverLixeira = true),
                onExit: (_) => setState(() => _hoverLixeira = false),
                child: GestureDetector(
                  onTap: () {
                    ref.read(tarefasProvider.notifier).remover(tarefa.id);
                  },
                  child: Icon(
                    Icons.delete_outline,
                    size: 16,
                    color: _hoverLixeira
                        ? Colors.red.shade400
                        : Colors.white.withValues(alpha: 0.15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
