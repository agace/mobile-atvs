# Trabalho 3 - Calculadora em Flutter

## Descricao

Aplicativo de calculadora desenvolvido em Flutter com interface grafica funcional. Suporta adicao, subtracao, multiplicacao, divisao, parenteses, limpeza de operacao e historico de calculos realizados. O projeto utiliza componentizacao de widgets reutilizaveis.

## Estrutura de componentes

### main.dart

Ponto de entrada da aplicacao. Configura o MaterialApp com tema escuro.

### calculadora_page.dart

Tela principal que gerencia o estado da calculadora (expressao digitada, resultado e lista de historico). Contem a logica de calculo com suporte a precedencia de operadores e parenteses. A cada calculo bem-sucedido, a expressao e o resultado sao adicionados ao historico. Possui um botao no AppBar que navega para a tela de historico.

### historico_page.dart

Tela secundaria que exibe o historico de calculos realizados durante a sessao. Recebe a lista de historico como parametro do construtor e utiliza `ListView.builder` para exibir os itens, com o calculo mais recente no topo. Quando a lista esta vazia, exibe uma mensagem indicando que nao ha calculos registrados.

### widgets/display_calculadora.dart

Widget reutilizavel responsavel por exibir a expressao atual e o resultado. Recebe `expressao` e `resultado` como parametros.

### widgets/botao_calculadora.dart

Widget reutilizavel que representa um botao da calculadora. Recebe `texto`, `onPressed`, `corFundo`, `corTexto` e `flex` como parametros, permitindo customizacao de cada botao.

### widgets/teclado_calculadora.dart

Widget reutilizavel que organiza os botoes em linhas utilizando Row e Column. Aplica cores diferentes para botoes numericos, operadores e funcoes (C, DEL, =). Recebe um callback `onPressed` que repassa o valor do botao pressionado.

## Como executar

1. Certifique-se de ter o [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado
2. Navegue ate o diretorio do projeto:

```bash
cd atv3
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

- Numeros de 0 a 9 e ponto decimal
- Operacoes: adicao (+), subtracao (-), multiplicacao (*), divisao (/)
- Parenteses para agrupar operacoes
- Botao C para limpar tudo
- Botao DEL para apagar o ultimo caractere
- Botao = para calcular o resultado
- Historico de calculos acessivel via botao no AppBar
