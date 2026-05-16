# Atividade 2 — Catalogo de Filmes com AutoRoute

App Flutter de catalogo de filmes utilizando o pacote **AutoRoute** para
navegacao declarativa entre telas.

## Desafios implementados

### Desafio 1 — Configuracao do AutoRoute
`lib/roteador/rotas_app.dart` declara `RoteadorApp extends RootStackRouter`
com `@AutoRouterConfig()` e duas rotas:

- `TelaInicioRoute` — tela de listagem (`/`).
- `TelaDetalhesFilmeRoute` — tela de detalhes (`/detalhes`).

Para regerar as rotas apos alteracao nas telas:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Desafio 2 — Integracao no App
`lib/main.dart` usa `MaterialApp.router(routerConfig: _roteador.config())`
para conectar o AutoRoute ao Flutter.

### Desafio 3 — Navegacao Moderna
Em `lib/telas/tela_inicio.dart`, o `onTap` da lista de filmes chama:

```dart
context.router.push(TelaDetalhesFilmeRoute(filme: filme));
```

substituindo a chamada imperativa `Navigator.push(...)`.

## Estrutura
```
lib/
├── main.dart                        # MaterialApp.router + RoteadorApp
├── roteador/
│   ├── rotas_app.dart               # Configuracao das rotas
│   └── rotas_app.gr.dart            # Gerado por build_runner
├── telas/
│   ├── tela_inicio.dart             # Tela inicial (lista de filmes)
│   └── tela_detalhes_filme.dart     # Tela de detalhes
├── models/
└── widgets/
```

## Executando

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run -d <chrome|macos|android|ios>
```

## Integrantes

- Bryan Charles
- Guilherme Sartori
- Guilherme Eidam
