import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/tarefas_provider.dart';

class CampoNovaTarefa extends ConsumerStatefulWidget {
  const CampoNovaTarefa({super.key});

  @override
  ConsumerState<CampoNovaTarefa> createState() => _CampoNovaTarefaState();
}

class _CampoNovaTarefaState extends ConsumerState<CampoNovaTarefa> {
  bool _hoverAdicionar = false;
  bool _hoverSalvar = false;
  bool _hoverCancelar = false;
  bool _editando = false;
  TextEditingController? _controller;
  FocusNode? _focusNode;

  void _iniciarEdicao() {
    _controller = TextEditingController();
    _focusNode = FocusNode();
    setState(() => _editando = true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode?.requestFocus();
    });
  }

  void _salvarEdicao() {
    if (!_editando) return;
    final texto = _controller?.text.trim() ?? '';
    if (texto.isNotEmpty) {
      ref.read(tarefasProvider.notifier).adicionar(texto);
    }
    _encerrarEdicao();
  }

  void _cancelarEdicao() {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        children: [
          Expanded(
            child: _editando
                ? TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
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
                  )
                : Text(
                    'Nova tarefa...',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.2),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
          ),
          if (_editando) ...[
            MouseRegion(
              onEnter: (_) => setState(() => _hoverSalvar = true),
              onExit: (_) => setState(() => _hoverSalvar = false),
              child: GestureDetector(
                onTap: _salvarEdicao,
                child: Icon(
                  Icons.check,
                  size: 16,
                  color: _hoverSalvar
                      ? Colors.white.withValues(alpha: 0.7)
                      : Colors.white.withValues(alpha: 0.15),
                ),
              ),
            ),
            const SizedBox(width: 16),
            MouseRegion(
              onEnter: (_) => setState(() => _hoverCancelar = true),
              onExit: (_) => setState(() => _hoverCancelar = false),
              child: GestureDetector(
                onTap: _cancelarEdicao,
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: _hoverCancelar
                      ? Colors.red.shade400
                      : Colors.white.withValues(alpha: 0.15),
                ),
              ),
            ),
          ] else
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) => setState(() => _hoverAdicionar = true),
              onExit: (_) => setState(() => _hoverAdicionar = false),
              child: GestureDetector(
                onTap: _iniciarEdicao,
                behavior: HitTestBehavior.opaque,
                child: Text(
                  'Adicionar',
                  style: TextStyle(
                    color: Colors.white.withValues(
                      alpha: _hoverAdicionar ? 0.7 : 0.35,
                    ),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
