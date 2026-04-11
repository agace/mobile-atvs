import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/tarefas_provider.dart';

class CampoNovaTarefa extends ConsumerStatefulWidget {
  const CampoNovaTarefa({super.key});

  @override
  ConsumerState<CampoNovaTarefa> createState() => _CampoNovaTarefaState();
}

class _CampoNovaTarefaState extends ConsumerState<CampoNovaTarefa> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  void _adicionar() {
    final texto = _controller.text.trim();
    if (texto.isEmpty) return;
    ref.read(tarefasProvider.notifier).adicionar(texto);
    _controller.clear();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.06),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                onSubmitted: (_) => _adicionar(),
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                cursorColor: Colors.white.withValues(alpha: 0.5),
                decoration: InputDecoration(
                  hintText: 'Adicionar tarefa...',
                  hintStyle: TextStyle(
                    color: Colors.white.withValues(alpha: 0.2),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            GestureDetector(
              onTap: _adicionar,
              child: Text(
                'Adicionar',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.4),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
