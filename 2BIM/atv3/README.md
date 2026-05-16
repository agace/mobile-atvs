# Atividade 3 — Movie App com integração TheMovieDB

App Flutter de catálogo de filmes consumindo a API real do
[The Movie Database (TMDB)](https://www.themoviedb.org/), estruturado com
Clean Architecture, **Riverpod** para gerenciamento de estado e **AutoRoute**
para navegação.

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

3. Regenere arquivos gerados quando necessário:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

## Executando

```bash
flutter run -d <chrome|android|ios|macos>
```

> No iOS em debug mode, o app só pode ser iniciado via `flutter run` ou pelo
> Xcode. Para abrir pelo ícone na home screen, use `flutter run --release`.

## Estrutura

```
lib/
├── main.dart                 # Entry point + carregamento do .env
├── providers.dart            # Providers do Riverpod
├── providers.g.dart          # Gerado
├── router/
│   ├── app_routes.dart       # Configuracao do AutoRoute
│   └── app_routes.gr.dart    # Gerado
├── data/
│   └── models/               # Modelos (Freezed + JSON serializable)
├── network/
│   └── movie_api_service.dart # Cliente Dio para TMDB
├── ui/
│   ├── main_screen.dart      # Casca de navegacao
│   ├── movie_viewmodel.dart  # ViewModel via Riverpod
│   ├── screens/              # Telas (home, genres, favorites, detail, videos)
│   ├── widgets/              # Componentes reutilizaveis
│   └── theme/                # Tema da aplicacao
└── utils/
```

## Funcionalidades

- Listagem de filmes em destaque, populares e mais bem avaliados.
- Busca e filtragem por gênero.
- Tela de detalhes com elenco, sinopse e trailer.
- Listagem de favoritos.

## Integrantes

- Bryan Charles
- Guilherme Sartori
- Guilherme Eidam
