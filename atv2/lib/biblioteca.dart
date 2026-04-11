import 'livro.dart';

class Biblioteca {
  final List<Livro> _livros = [];
  int _proximoId = 1;

  void cadastrarLivro(String titulo, String autor, int anoPublicacao) {
    final livro = Livro(
      id: _proximoId,
      titulo: titulo,
      autor: autor,
      anoPublicacao: anoPublicacao,
    );
    _livros.add(livro);
    _proximoId++;
    print('\n  [OK] Livro cadastrado com sucesso!\n');
  }

  void listarLivros() {
    if (_livros.isEmpty) {
      print('\n  Nenhum livro cadastrado.\n');
      return;
    }
    print('\n  LIVROS CADASTRADOS');
    print('  ==================\n');
    for (var livro in _livros) {
      print(livro.exibir());
    }
  }

  void atualizarLivro(int id, String titulo, String autor, int anoPublicacao) {
    final index = _livros.indexWhere((livro) => livro.id == id);
    if (index == -1) {
      print('\n  [ERRO] Livro com ID $id nao encontrado.\n');
      return;
    }
    _livros[index].titulo = titulo;
    _livros[index].autor = autor;
    _livros[index].anoPublicacao = anoPublicacao;
    print('\n  [OK] Livro atualizado com sucesso!\n');
  }

  void removerLivro(int id) {
    final index = _livros.indexWhere((livro) => livro.id == id);
    if (index == -1) {
      print('\n  [ERRO] Livro com ID $id nao encontrado.\n');
      return;
    }
    _livros.removeAt(index);
    print('\n  [OK] Livro removido com sucesso!\n');
  }
}
