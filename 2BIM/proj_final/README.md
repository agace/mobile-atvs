# ecremm — Loja Flutter (Projeto Final, Atividade 5)

**ecremm** é um aplicativo de **e-commerce** desenvolvido em Flutter como projeto
final do 2º bimestre. Consome a API pública [DummyJSON](https://dummyjson.com/) e
aplica **Arquitetura Limpa** com separação clara de responsabilidades.

> O nome nasceu de "commerce" escrito de trás para frente (`ecremmoc`), reduzido
> a **ecremm**.

## Identidade visual

Design **editorial e minimalista**: base neutra (tinta sobre off-white),
tipografia forte e um **único acento** de cor (verde-lima) reservado para
detalhes (selos de desconto, estados ativos). Superfícies delimitadas por
contornos finos em vez de sombras, com suporte a tema claro e escuro. Os tokens
da marca ficam centralizados em `lib/nucleo/tema/marca.dart`.

## Funcionalidades

- **Catálogo** de produtos com busca textual, filtro por categoria e ordenação
  (relevância, menor/maior preço, melhor avaliação).
- **Detalhes** do produto com navegação por parâmetro de rota.
- **Carrinho** de compras persistido localmente, com ajuste de quantidade,
  cálculo de subtotal, total e economia.
- **Favoritos** persistidos localmente.
- **Configurações**: tema claro/escuro e **idioma (Português/Inglês)** com
  troca em tempo real, salvos no dispositivo.
- **Central de notificações in-app**: ícone de sino com contador de não lidas;
  ao finalizar a compra, a confirmação do pedido entra na lista do sino.

## Requisitos técnicos atendidos

| Requisito | Implementação |
|-----------|---------------|
| Gestão de estado | **Riverpod** — providers organizados em `apresentacao/provedores` |
| Navegação | **GoRouter** com passagem de parâmetro (`/produto/:id`) |
| Consumo de API | **Dio** (requisições assíncronas) + **freezed/json_serializable** (modelagem JSON com geração de código) |
| Persistência simples | **SharedPreferences** (tema e idioma) |
| Persistência relacional | **SQLite via Drift** (carrinho e favoritos) |
| Arquitetura | **Clean Architecture** com Repositories e Sources |

## Arquitetura

Organização em camadas, do mais interno (regras) ao mais externo (UI):

```
lib/
├── dominio/                 # Núcleo: regras de negócio, sem dependências de framework
│   ├── entidades/           # Produto, Categoria, ItemCarrinho
│   ├── regras/              # RegrasProduto, RegrasCarrinho (funções puras, testáveis)
│   └── repositorios/        # Contratos (interfaces) dos repositórios
├── dados/                   # Implementações concretas
│   ├── modelos/             # DTOs freezed (JSON) + mapeamento para entidades
│   ├── fontes/              # Sources: FonteApiProdutos (Dio), BancoLocal (Drift)
│   └── repositorios/        # Implementações dos contratos do domínio
├── apresentacao/            # UI e estado
│   ├── provedores/          # Providers Riverpod e controladores
│   ├── rotas/               # Configuração do GoRouter
│   ├── telas/               # Catálogo, Detalhes, Carrinho, Favoritos, Ajustes
│   └── widgets/             # Componentes reutilizáveis
└── nucleo/                  # Infraestrutura compartilhada (tema, Dio, prefs, formatação)
```

O fluxo de dependências respeita a regra da arquitetura limpa: a apresentação e a
camada de dados dependem do domínio (contratos), nunca o contrário. A
implementação concreta dos repositórios é injetada via Riverpod, o que permite
substituir a fonte de dados (ex.: por dados falsos nos testes) sem alterar o
restante do app.

## Setup

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

A API DummyJSON é pública e **não requer chave**.

## Executando

```bash
flutter run -d <chrome|android|ios|macos>
```

## Testes

```bash
flutter test                                                    # unitários + widget
flutter test integration_test/fluxo_compra_test.dart -d macos   # integração
```

Cobertura entregue:

- **Unitários** (`test/unidade/`): regras de desconto, ordenação, filtro,
  totais do carrinho e conversão de dados JSON → entidade.
- **Widget** (`test/widget/`): renderização do cartão de produto (incl.
  alternância do selo de desconto) e do estado vazio.
- **Integração** (`integration_test/`): fluxo completo de catálogo → detalhe →
  adicionar ao carrinho.

## Equipe

- [Bryan Charles](https://github.com/agace)
- [Guilherme Sartori](https://github.com/Sartas12)
- [Guilherme Eidam](https://github.com/JaaPaah)
