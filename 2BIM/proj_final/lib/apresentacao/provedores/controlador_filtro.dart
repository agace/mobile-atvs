import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dominio/regras/regras_produto.dart';

class EstadoFiltro {
  const EstadoFiltro({
    this.categoria,
    this.termo = '',
    this.ordenacao = CriterioOrdenacao.relevancia,
  });

  final String? categoria;

  final String termo;

  final CriterioOrdenacao ordenacao;

  EstadoFiltro copiarCom({
    Object? categoria = _semAlteracao,
    String? termo,
    CriterioOrdenacao? ordenacao,
  }) {
    return EstadoFiltro(
      categoria: categoria == _semAlteracao
          ? this.categoria
          : categoria as String?,
      termo: termo ?? this.termo,
      ordenacao: ordenacao ?? this.ordenacao,
    );
  }

  static const _semAlteracao = Object();
}

class ControladorFiltro extends StateNotifier<EstadoFiltro> {
  ControladorFiltro() : super(const EstadoFiltro());

  void definirTermo(String termo) {
    state = state.copiarCom(termo: termo);
  }

  void selecionarCategoria(String? slug) {
    state = EstadoFiltro(categoria: slug, ordenacao: state.ordenacao);
  }

  void definirOrdenacao(CriterioOrdenacao ordenacao) {
    state = state.copiarCom(ordenacao: ordenacao);
  }

  void limpar() {
    state = EstadoFiltro(ordenacao: state.ordenacao);
  }
}
