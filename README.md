# Desenvolvimento Mobile com Dart e Flutter

![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white) ![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat&logo=flutter&logoColor=white) ![Riverpod](https://img.shields.io/badge/Riverpod-2.x-7C4DFF?style=flat)

<div align="center">

[Assistir apresentação no YouTube](https://www.youtube.com/watch?v=VjUld1umpbE)

</div>

Repositório com as atividades da disciplina **Programação para Dispositivos Móveis**, desenvolvidas em **Dart** e **Flutter**.

## Sumário

- [Projetos](#projetos)
- [Estrutura do repositório](#estrutura-do-repositório)
- [Tecnologias utilizadas](#tecnologias-utilizadas)
- [Como executar](#como-executar)
- [Equipe](#equipe)
- [Informações acadêmicas](#informações-acadêmicas)

## Projetos

| # | Nome | Tecnologia | Conceitos demonstrados |
|---|------|------------|------------------------|
| 1 | [Hello World](./atv1) | Dart | Configuração do ambiente Dart, primeiro programa, versionamento com Git |
| 2 | [CRUD Biblioteca](./atv2) | Dart | Programação Orientada a Objetos, classes e atributos, manipulação de listas, entrada/saída via terminal |
| 3 | [Calculadora](./atv3) | Flutter | Widgets com estado (StatefulWidget), componentização e reuso, parser de expressões com precedência e parênteses |
| 4 | [Lista de Tarefas](./atv4) | Flutter + Riverpod | Gestão de estado reativa com Notifier, separação em camadas (models, providers, widgets), UI reativa automática |

## Estrutura do repositório

```
mobile-atvs/
├── atv1/       # Hello World em Dart
├── atv2/       # CRUD de Biblioteca em Dart
├── atv3/       # Calculadora em Flutter
└── atv4/       # Lista de Tarefas em Flutter com Riverpod
```

Cada pasta contém um `README.md` próprio com detalhes do projeto correspondente.

## Tecnologias utilizadas

- **Dart SDK** — linguagem base e atividades de terminal
- **Flutter SDK** — aplicativos com interface gráfica
- **Riverpod** — gestão de estado reativa (atv4)

## Como executar

### Pré-requisitos

- [Dart SDK](https://dart.dev/get-dart) instalado (para atv1 e atv2)
- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado (para atv3 e atv4)
- Verifique sua instalação Flutter com:

```bash
flutter doctor
```

### Atividades em Dart (atv1, atv2)

```bash
cd atv1  # ou atv2
dart run
```

### Atividades em Flutter (atv3, atv4)

```bash
cd atv3  # ou atv4
flutter pub get
flutter run
```

## Equipe

- [Bryan Charles](https://github.com/agace)
- [Guilherme Sartori](https://github.com/Sartas12)
- [Guilherme Eidam](https://github.com/JaaPaah)

## Informações acadêmicas

- **Universidade:** Unicesumar
- **Disciplina:** Programação para Dispositivos Móveis
- **Semestre:** 7º
- **Professor:** [João Vitor dos Santos (Goku)](https://github.com/QAkarotto)
