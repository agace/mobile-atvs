import 'dart:io';
import 'package:atv2/biblioteca.dart';

String lerTextoNaoVazio(String prompt) {
  while (true) {
    stdout.write(prompt);
    final entrada = (stdin.readLineSync() ?? '').trim();
    if (entrada.isNotEmpty) return entrada;
    print('  [ERRO] O campo nao pode ser vazio. Tente novamente.');
  }
}

int lerAnoValido(String prompt) {
  while (true) {
    stdout.write(prompt);
    final entrada = stdin.readLineSync() ?? '';
    final ano = int.tryParse(entrada);
    if (ano != null && ano > 0) return ano;
    print('  [ERRO] Ano invalido. Digite um numero maior que zero.');
  }
}

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
        final titulo = lerTextoNaoVazio('  Titulo: ');
        final autor = lerTextoNaoVazio('  Autor: ');
        final ano = lerAnoValido('  Ano de publicacao: ');
        final editora = lerTextoNaoVazio('  Editora: ');
        final genero = lerTextoNaoVazio('  Genero: ');
        biblioteca.cadastrarLivro(titulo, autor, ano, editora, genero);
        break;
      case '2':
        biblioteca.listarLivros();
        break;
      case '3':
        print('');
        stdout.write('  ID do livro: ');
        final id = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        final novoTitulo = lerTextoNaoVazio('  Novo titulo: ');
        final novoAutor = lerTextoNaoVazio('  Novo autor: ');
        final novoAno = lerAnoValido('  Novo ano de publicacao: ');
        final novaEditora = lerTextoNaoVazio('  Nova editora: ');
        final novoGenero = lerTextoNaoVazio('  Novo genero: ');
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
