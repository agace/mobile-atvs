# Trabalho 2 - CRUD de Biblioteca em Dart

## Descricao

Sistema de gerenciamento de biblioteca executado no terminal. Permite cadastrar, listar, atualizar e remover livros utilizando um menu interativo. Desenvolvido em Dart com Programacao Orientada a Objetos.

## Classes utilizadas

### Livro

Representa um livro com os atributos:

- `id` - identificador unico gerado automaticamente
- `titulo` - titulo do livro
- `autor` - autor do livro
- `anoPublicacao` - ano de publicacao

Possui o metodo `exibir()` que retorna os dados formatados.

### Biblioteca

Gerencia a colecao de livros armazenados em uma lista. Metodos:

- `cadastrarLivro()` - cria um novo livro e adiciona a lista
- `listarLivros()` - exibe todos os livros cadastrados
- `atualizarLivro()` - atualiza os dados de um livro pelo ID
- `removerLivro()` - remove um livro pelo ID

## Como executar

1. Certifique-se de ter o [Dart SDK](https://dart.dev/get-dart) instalado
2. Navegue ate o diretorio do projeto:

```bash
cd atv2
```

3. Execute o programa:

```bash
dart run
```

## Exemplos de uso

### Cadastrar um livro

```text
  Opcao: 1

  Titulo: O Senhor dos Aneis
  Autor: J.R.R. Tolkien
  Ano de publicacao: 1954

  [OK] Livro cadastrado com sucesso!
```

### Cadastrar outro livro

```text
  Opcao: 1

  Titulo: Dom Casmurro
  Autor: Machado de Assis
  Ano de publicacao: 1899

  [OK] Livro cadastrado com sucesso!
```

### Listar livros

```text
  Opcao: 2

  LIVROS CADASTRADOS
  ==================

  ID:     1
  Titulo: O Senhor dos Aneis
  Autor:  J.R.R. Tolkien
  Ano:    1954

  ID:     2
  Titulo: Dom Casmurro
  Autor:  Machado de Assis
  Ano:    1899
```

### Atualizar um livro

```text
  Opcao: 3

  ID do livro: 2
  Novo titulo: Dom Casmurro - Edicao Especial
  Novo autor: Machado de Assis
  Novo ano de publicacao: 1900

  [OK] Livro atualizado com sucesso!
```

### Remover um livro

```text
  Opcao: 4

  ID do livro: 1

  [OK] Livro removido com sucesso!
```

### Sair

```text
  Opcao: 5

  Saindo...
```
