class Notificacao {
  const Notificacao({
    required this.id,
    required this.titulo,
    required this.mensagem,
    required this.criadaEm,
    this.lida = false,
  });

  final String id;
  final String titulo;
  final String mensagem;
  final DateTime criadaEm;
  final bool lida;

  Notificacao copyWith({bool? lida}) => Notificacao(
    id: id,
    titulo: titulo,
    mensagem: mensagem,
    criadaEm: criadaEm,
    lida: lida ?? this.lida,
  );
}
