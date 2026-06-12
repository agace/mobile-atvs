import 'package:flutter_test/flutter_test.dart';
import 'package:loja/nucleo/i18n/textos.dart';

void main() {
  group('Textos.para', () {
    test('retorna portugues por padrao e para codigo "pt"', () {
      expect(Textos.para('pt'), isA<TextosPt>());
      expect(Textos.para('qualquer'), isA<TextosPt>());
      expect(Textos.para('pt').finalizarCompra, 'Finalizar compra');
      expect(Textos.para('pt').locale.languageCode, 'pt');
    });

    test('retorna ingles para codigo "en"', () {
      expect(Textos.para('en'), isA<TextosEn>());
      expect(Textos.para('en').finalizarCompra, 'Checkout');
      expect(Textos.para('en').locale.languageCode, 'en');
    });

    test('textos diferem entre os dois idiomas', () {
      expect(
        Textos.para('pt').abaCatalogo,
        isNot(equals(Textos.para('en').abaCatalogo)),
      );
    });
  });
}
