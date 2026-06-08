import 'package:intl/intl.dart';

class Formatador {
  Formatador._();

  static final _moeda = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  static String moeda(double valor) => _moeda.format(valor);

  static final _dataCurta = DateFormat('dd/MM');

  static String dataCurta(DateTime data) => _dataCurta.format(data);

  static final _dataHora = DateFormat('dd/MM HH:mm');

  static String dataHora(DateTime data) => _dataHora.format(data);
}
