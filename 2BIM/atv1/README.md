# Movie App – Atividade Avaliativa 1 (2º Bimestre)

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat&logo=flutter&logoColor=white) ![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)

Resolução dos desafios propostos pelo professor sobre o **código base do Movie App** (lista de filmes em Flutter). O enunciado original está em [`ATIVIDADES AVALIATIVAS/2BIM/ATIVIDADE_AVALIATIVA_1.md`](https://github.com/QAkarotto/unicesumar-mobile/blob/main/ATIVIDADES%20AVALIATIVAS/2BIM/ATIVIDADE_AVALIATIVA_1.md) no repositório do professor.

## Sumário

- [Como executar](#como-executar)
- [Desafio 1 – Renderização sob demanda](#desafio-1--renderização-sob-demanda)
- [Estrutura do projeto](#estrutura-do-projeto)
- [Equipe](#equipe)

## Como executar

```bash
flutter pub get
flutter run
```

Para rodar os testes:

```bash
flutter test
```

## Desafio 1 – Renderização sob demanda

### Problema

O código original utilizava um `ListView` com `children`, que constrói **todos** os widgets da lista de uma só vez, mesmo aqueles fora da tela. Em listas grandes isso desperdiça memória e degrada o desempenho.

```dart
// antes
return ListView(
  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
  children: <Widget>[
    for (final FilmeItem filme in filmes)
      Center(child: Container(...)),
  ],
);
```

### Solução

Substituímos por `ListView.builder`, que constrói os itens **sob demanda** (lazy) à medida que o usuário rola a lista. O Flutter mantém em memória apenas os itens visíveis (e poucos vizinhos), tornando a renderização constante em relação ao tamanho da lista.

```dart
// depois
return ListView.builder(
  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
  itemCount: filmes.length,
  itemBuilder: (BuildContext context, int index) {
    final FilmeItem filme = filmes[index];
    return Center(child: Container(...));
  },
);
```

**Arquivo:** [`lib/widgets/filmes_listview.dart`](./lib/widgets/filmes_listview.dart)

## Estrutura do projeto

```
2BIM/atv1/
├── lib/
│   ├── main.dart                     # tela principal
│   ├── models/
│   │   ├── filme_item.dart
│   │   └── tema_item.dart
│   └── widgets/
│       ├── filmes_listview.dart      # ListView.builder (Desafio 1)
│       └── temas_gridview.dart
├── assets/data/filmes.json           # dados de exemplo
└── pubspec.yaml
```

## Equipe

- [Bryan Charles](https://github.com/agace)
- [Guilherme Sartori](https://github.com/Sartas12)
- [Guilherme Eidam](https://github.com/JaaPaah)
