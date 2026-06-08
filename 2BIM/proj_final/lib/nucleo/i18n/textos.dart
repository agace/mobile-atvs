import 'package:flutter/widgets.dart';

import '../../dominio/regras/regras_produto.dart';

class TextoPromo {
  const TextoPromo({
    required this.etiqueta,
    required this.titulo,
    required this.subtitulo,
  });

  final String etiqueta;
  final String titulo;
  final String subtitulo;
}

abstract class Textos {
  const Textos();

  factory Textos.para(String idioma) =>
      idioma == 'en' ? const TextosEn() : const TextosPt();

  static Textos of(BuildContext context) => TextosEscopo.of(context);

  Locale get locale;

  String get abaCatalogo;
  String get abaCarrinho;
  String get abaFavoritos;
  String get abaAjustes;

  String get buscaHint;
  String get secaoProdutos;
  String get notificacoesTooltip;
  String get categoriaTodas;
  String get catErroTitulo;
  String get catErroDescricao;
  String get catVazioTitulo;
  String get catVazioDescricao;
  String rotuloOrdenacao(CriterioOrdenacao criterio);
  List<TextoPromo> get promos;

  String get carrinhoTitulo;
  String get esvaziarTooltip;
  String get carrinhoErro;
  String get carrinhoVazioTitulo;
  String get carrinhoVazioDescricao;
  String get explorarCatalogo;
  String get subtotal;
  String get economia;
  String get frete;
  String get gratis;
  String get total;
  String get finalizarCompra;
  String get freteFaltaPrefixo;
  String get freteFaltaSufixo;

  String get pedidoConfirmadoTitulo;
  String get pedidoConfirmadoMensagem;
  String get rotuloPedido;
  String get rotuloItens;
  String get rotuloTotalPago;
  String get entregaEstimada;
  String entregaAte(String data);
  String get continuarComprando;

  String get favoritosTitulo;
  String get favoritosErro;
  String get favoritosVazioTitulo;
  String get favoritosVazioDescricao;

  String get detalheFalhaCarregar;
  String get emEstoque;
  String get indisponivel;
  String get descricao;
  String adicionar(String preco);
  String get esgotado;

  String get preferencias;
  String get temaEscuro;
  String get temaEscuroSubtitulo;
  String get idiomaLabel;
  String get sobre;
  String get versao;
  String get projetoFinal;
  String get projetoFinalSubtitulo;

  String get notificacoesTitulo;
  String get limpar;
  String get notifVazioTitulo;
  String get notifVazioDescricao;
  String compraNotifTitulo(String numero);
  String compraNotifMensagem(String total);
}

class TextosPt extends Textos {
  const TextosPt();

  @override
  Locale get locale => const Locale('pt', 'BR');

  @override
  String get abaCatalogo => 'Catálogo';
  @override
  String get abaCarrinho => 'Carrinho';
  @override
  String get abaFavoritos => 'Favoritos';
  @override
  String get abaAjustes => 'Ajustes';

  @override
  String get buscaHint => 'O que você procura hoje?';
  @override
  String get secaoProdutos => 'Produtos';
  @override
  String get notificacoesTooltip => 'Notificações';
  @override
  String get categoriaTodas => 'Todas';
  @override
  String get catErroTitulo => 'Falha ao carregar';
  @override
  String get catErroDescricao => 'Verifique sua conexão e tente novamente.';
  @override
  String get catVazioTitulo => 'Nenhum produto encontrado';
  @override
  String get catVazioDescricao => 'Tente outra busca ou categoria.';

  @override
  String rotuloOrdenacao(CriterioOrdenacao criterio) => switch (criterio) {
    CriterioOrdenacao.relevancia => 'Relevância',
    CriterioOrdenacao.menorPreco => 'Menor preço',
    CriterioOrdenacao.maiorPreco => 'Maior preço',
    CriterioOrdenacao.melhorAvaliacao => 'Melhor avaliação',
  };

  @override
  List<TextoPromo> get promos => const [
    TextoPromo(
      etiqueta: 'OFERTAS DA SEMANA',
      titulo: 'Até 50% OFF',
      subtitulo: 'Em itens selecionados, por tempo limitado.',
    ),
    TextoPromo(
      etiqueta: 'FRETE GRÁTIS',
      titulo: 'Acima de R\$ 199',
      subtitulo: 'Receba em casa sem pagar a mais.',
    ),
    TextoPromo(
      etiqueta: 'NOVIDADES',
      titulo: 'Lançamentos do mês',
      subtitulo: 'Confira o que acabou de chegar.',
    ),
  ];

  @override
  String get carrinhoTitulo => 'Carrinho';
  @override
  String get esvaziarTooltip => 'Esvaziar';
  @override
  String get carrinhoErro => 'Erro ao abrir o carrinho.';
  @override
  String get carrinhoVazioTitulo => 'Seu carrinho está vazio';
  @override
  String get carrinhoVazioDescricao =>
      'Explore o catálogo e adicione seus produtos.';
  @override
  String get explorarCatalogo => 'Explorar catálogo';
  @override
  String get subtotal => 'Subtotal';
  @override
  String get economia => 'Economia';
  @override
  String get frete => 'Frete';
  @override
  String get gratis => 'Grátis';
  @override
  String get total => 'Total';
  @override
  String get finalizarCompra => 'Finalizar compra';
  @override
  String get freteFaltaPrefixo => 'Faltam ';
  @override
  String get freteFaltaSufixo => ' para o frete grátis.';

  @override
  String get pedidoConfirmadoTitulo => 'Pedido confirmado!';
  @override
  String get pedidoConfirmadoMensagem =>
      'Obrigado pela compra. Você receberá as novidades por aqui.';
  @override
  String get rotuloPedido => 'Pedido';
  @override
  String get rotuloItens => 'Itens';
  @override
  String get rotuloTotalPago => 'Total pago';
  @override
  String get entregaEstimada => 'Entrega estimada';
  @override
  String entregaAte(String data) => 'até $data';
  @override
  String get continuarComprando => 'Continuar comprando';

  @override
  String get favoritosTitulo => 'Meus favoritos';
  @override
  String get favoritosErro => 'Erro ao abrir favoritos.';
  @override
  String get favoritosVazioTitulo => 'Nenhum favorito ainda';
  @override
  String get favoritosVazioDescricao =>
      'Toque no coração de um produto para salvá-lo aqui.';

  @override
  String get detalheFalhaCarregar => 'Falha ao carregar o produto.';
  @override
  String get emEstoque => 'Em estoque';
  @override
  String get indisponivel => 'Indisponível';
  @override
  String get descricao => 'Descrição';
  @override
  String adicionar(String preco) => 'Adicionar  $preco';
  @override
  String get esgotado => 'Esgotado';

  @override
  String get preferencias => 'Preferências';
  @override
  String get temaEscuro => 'Tema escuro';
  @override
  String get temaEscuroSubtitulo => 'Salvo automaticamente neste dispositivo';
  @override
  String get idiomaLabel => 'Idioma';
  @override
  String get sobre => 'Sobre';
  @override
  String get versao => 'Versão';
  @override
  String get projetoFinal => 'Projeto Final - Mobile 2BIM';
  @override
  String get projetoFinalSubtitulo =>
      'Clean Architecture, Riverpod, GoRouter, Dio, '
      'SharedPreferences e SQLite.';

  @override
  String get notificacoesTitulo => 'Notificações';
  @override
  String get limpar => 'Limpar';
  @override
  String get notifVazioTitulo => 'Nenhuma notificação';
  @override
  String get notifVazioDescricao =>
      'Suas atualizações de pedidos aparecerão aqui.';
  @override
  String compraNotifTitulo(String numero) => 'Pedido $numero confirmado!';
  @override
  String compraNotifMensagem(String total) =>
      'Recebemos sua compra de $total. Acompanhe a entrega por aqui.';
}

class TextosEn extends Textos {
  const TextosEn();

  @override
  Locale get locale => const Locale('en', 'US');

  @override
  String get abaCatalogo => 'Catalog';
  @override
  String get abaCarrinho => 'Cart';
  @override
  String get abaFavoritos => 'Favorites';
  @override
  String get abaAjustes => 'Settings';

  @override
  String get buscaHint => 'What are you looking for today?';
  @override
  String get secaoProdutos => 'Products';
  @override
  String get notificacoesTooltip => 'Notifications';
  @override
  String get categoriaTodas => 'All';
  @override
  String get catErroTitulo => 'Failed to load';
  @override
  String get catErroDescricao => 'Check your connection and try again.';
  @override
  String get catVazioTitulo => 'No products found';
  @override
  String get catVazioDescricao => 'Try another search or category.';

  @override
  String rotuloOrdenacao(CriterioOrdenacao criterio) => switch (criterio) {
    CriterioOrdenacao.relevancia => 'Relevance',
    CriterioOrdenacao.menorPreco => 'Lowest price',
    CriterioOrdenacao.maiorPreco => 'Highest price',
    CriterioOrdenacao.melhorAvaliacao => 'Top rated',
  };

  @override
  List<TextoPromo> get promos => const [
    TextoPromo(
      etiqueta: 'DEALS OF THE WEEK',
      titulo: 'Up to 50% OFF',
      subtitulo: 'On selected items, for a limited time.',
    ),
    TextoPromo(
      etiqueta: 'FREE SHIPPING',
      titulo: 'Over R\$ 199',
      subtitulo: 'Get it delivered at no extra cost.',
    ),
    TextoPromo(
      etiqueta: 'NEW ARRIVALS',
      titulo: 'This month\'s releases',
      subtitulo: 'Check out what just landed.',
    ),
  ];

  @override
  String get carrinhoTitulo => 'Cart';
  @override
  String get esvaziarTooltip => 'Clear';
  @override
  String get carrinhoErro => 'Failed to open the cart.';
  @override
  String get carrinhoVazioTitulo => 'Your cart is empty';
  @override
  String get carrinhoVazioDescricao =>
      'Browse the catalog and add your products.';
  @override
  String get explorarCatalogo => 'Browse catalog';
  @override
  String get subtotal => 'Subtotal';
  @override
  String get economia => 'Savings';
  @override
  String get frete => 'Shipping';
  @override
  String get gratis => 'Free';
  @override
  String get total => 'Total';
  @override
  String get finalizarCompra => 'Checkout';
  @override
  String get freteFaltaPrefixo => 'Add ';
  @override
  String get freteFaltaSufixo => ' more for free shipping.';

  @override
  String get pedidoConfirmadoTitulo => 'Order confirmed!';
  @override
  String get pedidoConfirmadoMensagem =>
      'Thanks for your purchase. You will get updates right here.';
  @override
  String get rotuloPedido => 'Order';
  @override
  String get rotuloItens => 'Items';
  @override
  String get rotuloTotalPago => 'Total paid';
  @override
  String get entregaEstimada => 'Estimated delivery';
  @override
  String entregaAte(String data) => 'by $data';
  @override
  String get continuarComprando => 'Continue shopping';

  @override
  String get favoritosTitulo => 'My favorites';
  @override
  String get favoritosErro => 'Failed to open favorites.';
  @override
  String get favoritosVazioTitulo => 'No favorites yet';
  @override
  String get favoritosVazioDescricao =>
      'Tap the heart on a product to save it here.';

  @override
  String get detalheFalhaCarregar => 'Failed to load the product.';
  @override
  String get emEstoque => 'In stock';
  @override
  String get indisponivel => 'Unavailable';
  @override
  String get descricao => 'Description';
  @override
  String adicionar(String preco) => 'Add  $preco';
  @override
  String get esgotado => 'Sold out';

  @override
  String get preferencias => 'Preferences';
  @override
  String get temaEscuro => 'Dark theme';
  @override
  String get temaEscuroSubtitulo => 'Saved automatically on this device';
  @override
  String get idiomaLabel => 'Language';
  @override
  String get sobre => 'About';
  @override
  String get versao => 'Version';
  @override
  String get projetoFinal => 'Final Project - Mobile 2BIM';
  @override
  String get projetoFinalSubtitulo =>
      'Clean Architecture, Riverpod, GoRouter, Dio, '
      'SharedPreferences and SQLite.';

  @override
  String get notificacoesTitulo => 'Notifications';
  @override
  String get limpar => 'Clear';
  @override
  String get notifVazioTitulo => 'No notifications';
  @override
  String get notifVazioDescricao => 'Your order updates will show up here.';
  @override
  String compraNotifTitulo(String numero) => 'Order $numero confirmed!';
  @override
  String compraNotifMensagem(String total) =>
      'We received your order of $total. Track delivery right here.';
}

class TextosEscopo extends InheritedWidget {
  const TextosEscopo({super.key, required this.textos, required super.child});

  final Textos textos;

  static Textos of(BuildContext context) {
    final escopo = context.dependOnInheritedWidgetOfExactType<TextosEscopo>();
    assert(escopo != null, 'TextosEscopo nao encontrado na arvore');
    return escopo!.textos;
  }

  @override
  bool updateShouldNotify(TextosEscopo oldWidget) =>
      textos.runtimeType != oldWidget.textos.runtimeType;
}
