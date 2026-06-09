import '../entidades/item_carrinho.dart';
import 'regras_produto.dart';

class RegrasCarrinho {
  RegrasCarrinho._();

  static const double limiteFreteGratis = 199;

  static const double valorFrete = 19.90;

  static double subtotalItem(ItemCarrinho item) {
    final precoFinal = RegrasProduto.aplicarDesconto(
      item.precoUnitario,
      item.percentualDesconto,
    );
    return (precoFinal * item.quantidade * 100).roundToDouble() / 100;
  }

  static double total(List<ItemCarrinho> itens) {
    final soma = itens.fold<double>(0, (acc, item) => acc + subtotalItem(item));
    return (soma * 100).roundToDouble() / 100;
  }

  static int quantidadeTotal(List<ItemCarrinho> itens) {
    return itens.fold<int>(0, (acc, item) => acc + item.quantidade);
  }

  static double economiaTotal(List<ItemCarrinho> itens) {
    final cheio = itens.fold<double>(
      0,
      (acc, item) => acc + item.precoUnitario * item.quantidade,
    );
    final economia = cheio - total(itens);
    return (economia * 100).roundToDouble() / 100;
  }

  static double frete(double subtotal) {
    if (subtotal <= 0 || subtotal >= limiteFreteGratis) return 0;
    return valorFrete;
  }

  static double faltaParaFreteGratis(double subtotal) {
    if (subtotal <= 0 || subtotal >= limiteFreteGratis) return 0;
    final falta = limiteFreteGratis - subtotal;
    return (falta * 100).roundToDouble() / 100;
  }

  static double totalAPagar(List<ItemCarrinho> itens) {
    final subtotal = total(itens);
    return (subtotal + frete(subtotal));
  }
}
