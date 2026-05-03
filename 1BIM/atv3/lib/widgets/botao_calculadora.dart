import 'package:flutter/material.dart';

class BotaoCalculadora extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;
  final Color corFundo;
  final Color corTexto;
  final int flex;

  const BotaoCalculadora({
    super.key,
    required this.texto,
    required this.onPressed,
    this.corFundo = const Color(0xFF333333),
    this.corTexto = Colors.white,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: corFundo,
            foregroundColor: corTexto,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20),
          ),
          child: Text(
            texto,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
