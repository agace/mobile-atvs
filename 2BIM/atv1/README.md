# Movie App – Atividade Avaliativa 1 (2º Bimestre)

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat&logo=flutter&logoColor=white) ![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)

Resolução dos dois desafios propostos pelo professor sobre o **código base do Movie App** (lista de filmes em Flutter). O enunciado original está em [`ATIVIDADES AVALIATIVAS/2BIM/ATIVIDADE_AVALIATIVA_1.md`](https://github.com/QAkarotto/unicesumar-mobile/blob/main/ATIVIDADES%20AVALIATIVAS/2BIM/ATIVIDADE_AVALIATIVA_1.md) no repositório do professor.

## Sumário

- [Como executar](#como-executar)
- [Desafio 1 – Renderização sob demanda](#desafio-1--renderização-sob-demanda)
- [Desafio 2 – Interação ao toque com feedback visual](#desafio-2--interação-ao-toque-com-feedback-visual)
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

## Desafio 2 – Interação ao toque com feedback visual

### Problema

Os cards de filme não tinham `onTap` e a tela principal não dava qualquer retorno ao usuário quando ele interagia com a lista.

### Solução

Implementamos **dois feedbacks visuais combinados**:

1. **Ripple no card** — envolvemos o conteúdo do card com `Material` + `InkWell`, que dispara o efeito ripple do Material Design no toque.
2. **`SnackBar` na tela principal** — o `FilmesListView` recebe um callback `onFilmeTap`. A tela principal (`TelaPrincipalMovieApp`) usa esse callback para exibir uma `SnackBar` flutuante com o título do filme selecionado, via `ScaffoldMessenger.of(context)`.

```dart
// filmes_listview.dart — card agora é tocável
Material(
  color: Colors.transparent,
  child: InkWell(
    onTap: onFilmeTap == null ? null : () => onFilmeTap!(filme),
    child: Column(...),
  ),
)
```

```dart
// main.dart — feedback na tela principal
void _mostrarFeedback(BuildContext context, FilmeItem filme) {
  final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text('Selecionado: ${filme.titulo}'),
    ),
  );
}
```

A separação por callback (`ValueChanged<FilmeItem>?`) mantém o widget de lista **agnóstico ao que acontece no toque**, deixando a decisão na tela que o usa.

**Arquivos:** [`lib/widgets/filmes_listview.dart`](./lib/widgets/filmes_listview.dart) e [`lib/main.dart`](./lib/main.dart)

## Estrutura do projeto

```
2BIM/atv1/
├── lib/
│   ├── main.dart                     # tela principal + feedback (SnackBar)
│   ├── models/
│   │   ├── filme_item.dart
│   │   └── tema_item.dart
│   └── widgets/
│       ├── filmes_listview.dart      # ListView.builder + InkWell (Desafios 1 e 2)
│       └── temas_gridview.dart
├── assets/data/filmes.json           # dados de exemplo
└── pubspec.yaml
```

## Equipe

- [Bryan Charles](https://github.com/agace)
- [Guilherme Sartori](https://github.com/Sartas12)
- [Guilherme Eidam](https://github.com/JaaPaah)
