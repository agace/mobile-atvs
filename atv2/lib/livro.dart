class Livro {
  int id;
  String titulo;
  String autor;
  int anoPublicacao;

  Livro({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.anoPublicacao,
  });

  String exibir() {
    final buffer = StringBuffer();
    buffer.writeln('  ID:     $id');
    buffer.writeln('  Titulo: $titulo');
    buffer.writeln('  Autor:  $autor');
    buffer.writeln('  Ano:    $anoPublicacao');
    return buffer.toString();
  }
}
