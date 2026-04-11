import 'package:flutter/material.dart';
import 'botao_calculadora.dart';

class TecladoCalculadora extends StatelessWidget {
  final void Function(String) onPressed;

  const TecladoCalculadora({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLinha(['C', '(', ')', '/']),
        _buildLinha(['7', '8', '9', '*']),
        _buildLinha(['4', '5', '6', '-']),
        _buildLinha(['1', '2', '3', '+']),
        _buildLinha(['0', '.', 'DEL', '=']),
      ],
    );
  }

  Widget _buildLinha(List<String> botoes) {
    return Row(
      children: botoes.map((texto) {
        Color corFundo;
        Color corTexto = Colors.white;

        if (texto == '=') {
          corFundo = Colors.orange;
        } else if (texto == 'C' || texto == 'DEL') {
          corFundo = const Color(0xFFA5A5A5);
          corTexto = Colors.black;
        } else if (['+', '-', '*', '/', '(', ')'].contains(texto)) {
          corFundo = const Color(0xFF636363);
        } else {
          corFundo = const Color(0xFF333333);
        }

        return BotaoCalculadora(
          texto: texto,
          onPressed: () => onPressed(texto),
          corFundo: corFundo,
          corTexto: corTexto,
        );
      }).toList(),
    );
  }
}
