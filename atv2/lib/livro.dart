class Livro {
  int id;
  String titulo;
  String autor;
  int anoPublicacao;
  String editora;
  String genero;

  Livro({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.anoPublicacao,
    required this.editora,
    required this.genero,
  });

  String exibir() {
    final buffer = StringBuffer();
    buffer.writeln('  ID:      $id');
    buffer.writeln('  Titulo:  $titulo');
    buffer.writeln('  Autor:   $autor');
    buffer.writeln('  Ano:     $anoPublicacao');
    buffer.writeln('  Editora: $editora');
    buffer.writeln('  Genero:  $genero');
    return buffer.toString();
  }
}
