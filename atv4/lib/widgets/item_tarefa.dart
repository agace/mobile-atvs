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
  bool _hoverEditar = false;
  bool _hoverCancelar = false;
  bool _editando = false;
  bool _cancelando = false;
  TextEditingController? _controller;
  FocusNode? _focusNode;

  void _iniciarEdicao() {
    final tarefa = widget.tarefa;
    _controller = TextEditingController(text: tarefa.titulo);
    _focusNode = FocusNode();
    setState(() => _editando = true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode?.requestFocus();
    });
  }

  void _salvarEdicao() {
    if (!_editando) return;
    if (_cancelando) {
      _cancelando = false;
      _encerrarEdicao();
      return;
    }
    final novoTitulo = _controller?.text.trim() ?? '';
    final tituloAtual = widget.tarefa.titulo;
    if (novoTitulo.isNotEmpty && novoTitulo != tituloAtual) {
      ref.read(tarefasProvider.notifier).editar(widget.tarefa.id, novoTitulo);
    }
    _encerrarEdicao();
  }

  void _cancelarEdicao() {
    _cancelando = false;
    _encerrarEdicao();
  }

  void _encerrarEdicao() {
    _controller?.dispose();
    _focusNode?.dispose();
    _controller = null;
    _focusNode = null;
    if (mounted) setState(() => _editando = false);
  }

  @override
  void dispose() {
    _controller?.dispose();
    _focusNode?.dispose();
    super.dispose();
  }

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
        onTap: _editando
            ? null
            : () {
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
                child: _editando
                    ? TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          letterSpacing: 0.1,
                        ),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onSubmitted: (_) => _salvarEdicao(),
                        onTapOutside: (_) => _salvarEdicao(),
                      )
                    : Text(
                        tarefa.titulo,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: tarefa.concluida
                              ? Colors.white.withValues(alpha: 0.2)
                              : Colors.white.withValues(alpha: 0.85),
                          decoration: tarefa.concluida
                              ? TextDecoration.lineThrough
                              : null,
                          decorationColor: Colors.white.withValues(alpha: 0.2),
                          letterSpacing: 0.1,
                        ),
                      ),
              ),
              if (_editando)
                MouseRegion(
                  onEnter: (_) => setState(() => _hoverCancelar = true),
                  onExit: (_) => setState(() => _hoverCancelar = false),
                  child: Listener(
                    onPointerDown: (_) => _cancelando = true,
                    child: GestureDetector(
                      onTap: _cancelarEdicao,
                      child: Icon(
                        Icons.close,
                        size: 16,
                        color: _hoverCancelar
                            ? Colors.white.withValues(alpha: 0.7)
                            : Colors.white.withValues(alpha: 0.15),
                      ),
                    ),
                  ),
                )
              else ...[
                MouseRegion(
                  onEnter: (_) => setState(() => _hoverEditar = true),
                  onExit: (_) => setState(() => _hoverEditar = false),
                  child: GestureDetector(
                    onTap: _iniciarEdicao,
                    child: Icon(
                      Icons.edit_outlined,
                      size: 16,
                      color: _hoverEditar
                          ? Colors.white.withValues(alpha: 0.7)
                          : Colors.white.withValues(alpha: 0.15),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
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
            ],
          ),
        ),
      ),
    );
  }
}
