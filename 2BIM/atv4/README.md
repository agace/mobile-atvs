# Atividade 4 — Movie App com Armazenamento Local

Evolução do Movie App (Atividade 3) com **armazenamento local em dois níveis**:

- **SharedPreferences** para dados simples (tema, último termo de busca e último
  critério de ordenação).
- **SQLite via [Drift](https://drift.simonbinder.eu/)** para persistência
  relacional dos filmes favoritados.

App Flutter de catálogo de filmes consumindo a API do
[The Movie Database (TMDB)](https://www.themoviedb.org/), com **Riverpod** para
gerenciamento de estado e **AutoRoute** para navegação.

## Setup

1. Instale as dependências:
   ```bash
   flutter pub get
   ```

2. Crie sua chave de API em https://www.themoviedb.org/settings/api e
   copie o arquivo de exemplo:
   ```bash
   cp ".env (example)" .env
   ```
   Em seguida edite `.env` e cole sua chave:
   ```
   TMDB_KEY=sua_chave_aqui
   ```

3. Regenere os arquivos gerados (Drift, Riverpod, AutoRoute, Freezed):
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

## Executando

```bash
flutter run -d <chrome|android|ios|macos>
```

> No iOS em debug mode, o app só pode ser iniciado via `flutter run` ou pelo
> Xcode. Para abrir pelo ícone na home screen, use `flutter run --release`.

## Funcionalidades de armazenamento local

### 1. Tema claro/escuro (SharedPreferences)
- O app oferece tema **claro** e **escuro**; alterne pelo ícone de sol/lua no
  topo da tela inicial.
- A escolha é salva em SharedPreferences e restaurada ao reabrir o app.

### 2. Busca e ordenação (SharedPreferences)
- Na tela de **Gêneros**, o último termo de busca e o último critério de
  ordenação são salvos e restaurados automaticamente ao abrir a tela.

### 3. Favoritos (SQLite/Drift)
- Favoritar um filme na tela de detalhes grava o registro no banco local.
- A tela de **Favoritos** lê diretamente do banco (stream em tempo real).
- Desfavoritar remove o registro do banco.

## Estrutura

```
lib/
├── main.dart                       # Entry point: .env + SharedPreferences + tema
├── provedores.dart                 # Providers do Riverpod (banco, prefs, tema)
├── dados/
│   ├── banco/
│   │   ├── banco_dados.dart        # Banco Drift (tabela Favoritos)
│   │   └── banco_dados.g.dart      # Gerado pelo Drift
│   └── modelos/                    # Modelos (Freezed + JSON serializable)
├── rede/
│   └── servico_api_filmes.dart     # Cliente Dio para TMDB
├── roteador/                       # Configuração do AutoRoute
├── ui/
│   ├── tela_principal.dart         # Casca de navegação
│   ├── viewmodel_filmes.dart       # ViewModel (API + banco)
│   ├── telas/                      # Telas (inicio, generos, favoritos, detalhe, videos)
│   ├── widgets/                    # Componentes reutilizáveis
│   └── tema/tema.dart              # Temas claro e escuro
└── utilitarios/
    ├── prefs.dart                  # Wrapper do SharedPreferences
    └── utilitarios.dart            # Helpers (URLs de imagem, enum Sorting)
```

## Equipe

- [Bryan Charles](https://github.com/agace)
- [Guilherme Sartori](https://github.com/Sartas12)
- [Guilherme Eidam](https://github.com/JaaPaah)
