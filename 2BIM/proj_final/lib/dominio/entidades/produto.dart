class Produto {
  const Produto({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.categoria,
    required this.preco,
    required this.percentualDesconto,
    required this.avaliacao,
    required this.estoque,
    required this.marca,
    required this.miniatura,
    required this.imagens,
  });

  final int id;
  final String titulo;
  final String descricao;
  final String categoria;
  final double preco;
  final double percentualDesconto;
  final double avaliacao;
  final int estoque;
  final String marca;
  final String miniatura;
  final List<String> imagens;

  bool get temDesconto => percentualDesconto > 0;

  bool get disponivel => estoque > 0;
}
