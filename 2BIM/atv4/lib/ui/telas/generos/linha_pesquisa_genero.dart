import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:filmes/ui/tema/tema.dart';

typedef OnSearch = void Function(String searchString);

class LinhaPesquisaGenero extends ConsumerStatefulWidget {
  final OnSearch onSearch;
  final String textoInicial;

  const LinhaPesquisaGenero(this.onSearch,
      {this.textoInicial = '', super.key});

  @override
  ConsumerState<LinhaPesquisaGenero> createState() => _GenreSearchRowState();
}

class _GenreSearchRowState extends ConsumerState<LinhaPesquisaGenero> {
  late TextEditingController movieTextController;
  final FocusNode textFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Restaura o ultimo termo de busca salvo em SharedPreferences.
    movieTextController = TextEditingController(text: widget.textoInicial);
  }

  @override
  void dispose() {
    movieTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final escuro = Theme.of(context).brightness == Brightness.dark;
    final corCaixa = escuro ? fundoBarraBusca : fundoBarraBuscaClaro;
    final corTexto = escuro ? Colors.white : textoClaro;
    return Row(mainAxisSize: MainAxisSize.max, children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: TextField(
            style: TextStyle(color: corTexto),
            focusNode: textFocusNode,
            keyboardType: TextInputType.text,
            enableSuggestions: false,
            autofocus: false,
            onSubmitted: (value) {
              widget.onSearch(value);
            },
            controller: movieTextController,
            autocorrect: false,
            decoration: InputDecoration(
              filled: true,
              focusColor: corCaixa,
              focusedBorder: null,
              enabledBorder: null,
              fillColor: corCaixa,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              hintText: 'movie name, genre',
              hintStyle: body1Regular.copyWith(color: bordaPoster),
              suffixIcon: IconButton(
                onPressed: () {
                  movieTextController.clear();
                },
                icon: Icon(Icons.close, color: corTexto),
              ),
              prefixIcon: IconButton(
                icon: Icon(Icons.search, color: corTexto),
                onPressed: () {
                  widget.onSearch(movieTextController.text);
                },
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
