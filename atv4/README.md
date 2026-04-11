# Trabalho 4 - Lista de Tarefas com Gestao de Estado

## Descricao

Aplicativo de lista de tarefas (To-Do List) desenvolvido em Flutter com gestao de estado utilizando Riverpod. Permite adicionar, visualizar, marcar como concluida e remover tarefas.

## Gestao de estado

O estado da aplicacao e gerenciado pelo Riverpod atraves da classe `TarefasNotifier` que estende `Notifier<List<Tarefa>>`. O provider `tarefasProvider` expoe a lista de tarefas para toda a aplicacao de forma reativa.

A classe `TarefasNotifier` possui os metodos:

- `adicionar()` - cria uma nova tarefa e adiciona ao estado
- `alternarConclusao()` - alterna o status de conclusao de uma tarefa
- `remover()` - remove uma tarefa do estado

Cada vez que o estado e atualizado, os widgets que observam o provider sao reconstruidos automaticamente pelo Riverpod.

## Estrutura do projeto

```
lib/
├── main.dart                          # Ponto de entrada com ProviderScope
├── tarefas_page.dart                  # Tela principal
├── models/
│   └── tarefa.dart                    # Modelo de dados da tarefa
├── providers/
│   └── tarefas_provider.dart          # Notifier e provider Riverpod
└── widgets/
    ├── campo_nova_tarefa.dart         # Campo de texto e botao para adicionar
    ├── item_tarefa.dart               # Card individual de cada tarefa
    └── lista_tarefas.dart             # ListView.builder com as tarefas
```

## Como executar

1. Certifique-se de ter o [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado
2. Navegue ate o diretorio do projeto:

```bash
cd atv4
```

3. Instale as dependencias:

```bash
flutter pub get
```

4. Execute o aplicativo:

```bash
flutter run
```

## Funcionalidades

- Campo de texto para inserir nova tarefa
- Botao para adicionar tarefa (tambem funciona com Enter)
- Lista exibindo todas as tarefas com ListView.builder
- Checkbox para marcar tarefa como concluida (texto fica riscado e cinza)
- Botao para remover tarefa
- Mensagem quando nao ha tarefas cadastradas
