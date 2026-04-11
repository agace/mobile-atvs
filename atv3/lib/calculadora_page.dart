import 'package:flutter/material.dart';
import 'widgets/display_calculadora.dart';
import 'widgets/teclado_calculadora.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  String _expressao = '';
  String _resultado = '0';

  void _onBotaoPressed(String valor) {
    setState(() {
      switch (valor) {
        case 'C':
          _expressao = '';
          _resultado = '0';
          break;
        case 'DEL':
          if (_expressao.isNotEmpty) {
            _expressao = _expressao.substring(0, _expressao.length - 1);
          }
          break;
        case '=':
          _calcular();
          break;
        default:
          _expressao += valor;
      }
    });
  }

  void _calcular() {
    try {
      final resultado = _avaliarExpressao(_expressao);
      if (resultado == resultado.toInt().toDouble()) {
        _resultado = resultado.toInt().toString();
      } else {
        _resultado = resultado.toStringAsFixed(8).replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '');
      }
    } catch (_) {
      _resultado = 'Erro';
    }
  }

  double _avaliarExpressao(String expr) {
    expr = expr.replaceAll(' ', '');
    final tokens = _tokenizar(expr);
    final pos = [0];
    final resultado = _parseExpressao(tokens, pos);
    if (pos[0] != tokens.length) throw FormatException('Expressao invalida');
    return resultado;
  }

  List<String> _tokenizar(String expr) {
    final tokens = <String>[];
    var i = 0;
    while (i < expr.length) {
      if ('+-*/()'.contains(expr[i])) {
        tokens.add(expr[i]);
        i++;
      } else if (expr[i] == '.' || _isDigit(expr[i])) {
        var num = '';
        while (i < expr.length && (expr[i] == '.' || _isDigit(expr[i]))) {
          num += expr[i];
          i++;
        }
        tokens.add(num);
      } else {
        i++;
      }
    }
    return tokens;
  }

  bool _isDigit(String c) => c.codeUnitAt(0) >= 48 && c.codeUnitAt(0) <= 57;

  double _parseExpressao(List<String> tokens, List<int> pos) {
    var resultado = _parseTermo(tokens, pos);
    while (pos[0] < tokens.length && (tokens[pos[0]] == '+' || tokens[pos[0]] == '-')) {
      final op = tokens[pos[0]];
      pos[0]++;
      final direita = _parseTermo(tokens, pos);
      if (op == '+') {
        resultado += direita;
      } else {
        resultado -= direita;
      }
    }
    return resultado;
  }

  double _parseTermo(List<String> tokens, List<int> pos) {
    var resultado = _parseFator(tokens, pos);
    while (pos[0] < tokens.length && (tokens[pos[0]] == '*' || tokens[pos[0]] == '/')) {
      final op = tokens[pos[0]];
      pos[0]++;
      final direita = _parseFator(tokens, pos);
      if (op == '*') {
        resultado *= direita;
      } else {
        resultado /= direita;
      }
    }
    return resultado;
  }

  double _parseFator(List<String> tokens, List<int> pos) {
    if (pos[0] < tokens.length && tokens[pos[0]] == '(') {
      pos[0]++;
      final resultado = _parseExpressao(tokens, pos);
      if (pos[0] < tokens.length && tokens[pos[0]] == ')') {
        pos[0]++;
      }
      return resultado;
    }

    if (pos[0] < tokens.length && tokens[pos[0]] == '-') {
      pos[0]++;
      return -_parseFator(tokens, pos);
    }

    if (pos[0] < tokens.length) {
      final valor = double.tryParse(tokens[pos[0]]);
      if (valor != null) {
        pos[0]++;
        return valor;
      }
    }
    throw FormatException('Expressao invalida');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculadora'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: DisplayCalculadora(
              expressao: _expressao,
              resultado: _resultado,
            ),
          ),
          TecladoCalculadora(onPressed: _onBotaoPressed),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
