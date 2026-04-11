import 'dart:io';
import 'package:atv2/biblioteca.dart';

void main() {
  final biblioteca = Biblioteca();

  while (true) {
    print('');
    print('  SISTEMA BIBLIOTECA');
    print('  ==================');
    print('  [1] Cadastrar livro');
    print('  [2] Listar livros');
    print('  [3] Atualizar livro');
    print('  [4] Remover livro');
    print('  [5] Sair');
    print('');
    stdout.write('  Opcao: ');

    final opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        print('');
        stdout.write('  Titulo: ');
        final titulo = stdin.readLineSync() ?? '';
        stdout.write('  Autor: ');
        final autor = stdin.readLineSync() ?? '';
        stdout.write('  Ano de publicacao: ');
        final ano = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        stdout.write('  Editora: ');
        final editora = stdin.readLineSync() ?? '';
        stdout.write('  Genero: ');
        final genero = stdin.readLineSync() ?? '';
        biblioteca.cadastrarLivro(titulo, autor, ano, editora, genero);
        break;
      case '2':
        biblioteca.listarLivros();
        break;
      case '3':
        print('');
        stdout.write('  ID do livro: ');
        final id = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        stdout.write('  Novo titulo: ');
        final novoTitulo = stdin.readLineSync() ?? '';
        stdout.write('  Novo autor: ');
        final novoAutor = stdin.readLineSync() ?? '';
        stdout.write('  Novo ano de publicacao: ');
        final novoAno = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        stdout.write('  Nova editora: ');
        final novaEditora = stdin.readLineSync() ?? '';
        stdout.write('  Novo genero: ');
        final novoGenero = stdin.readLineSync() ?? '';
        biblioteca.atualizarLivro(
          id,
          novoTitulo,
          novoAutor,
          novoAno,
          novaEditora,
          novoGenero,
        );
        break;
      case '4':
        print('');
        stdout.write('  ID do livro: ');
        final idRemover = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        biblioteca.removerLivro(idRemover);
        break;
      case '5':
        print('\n  Saindo...\n');
        return;
      default:
        print('\n  [ERRO] Opcao invalida.\n');
    }
  }
}
