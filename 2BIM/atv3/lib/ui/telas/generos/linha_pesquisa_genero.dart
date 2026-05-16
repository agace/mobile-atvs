import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:filmes/ui/tema/tema.dart';

typedef OnSearch = void Function(String searchString);

class LinhaPesquisaGenero extends ConsumerStatefulWidget {
  final OnSearch onSearch;

  const LinhaPesquisaGenero(this.onSearch, {super.key});

  @override
  ConsumerState<LinhaPesquisaGenero> createState() => _GenreSearchRowState();
}

class _GenreSearchRowState extends ConsumerState<LinhaPesquisaGenero> {
  late TextEditingController movieTextController;
  final FocusNode textFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    movieTextController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    movieTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.max, children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: TextField(
            style: const TextStyle(color: Colors.white),
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
              focusColor: fundoBarraBusca,
              focusedBorder: null,
              enabledBorder: null,
              fillColor: fundoBarraBusca,
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
                icon: const Icon(Icons.close, color: Colors.white,),
              ),
              prefixIcon: IconButton(
                icon: const Icon(Icons.search, color: Colors.white,),
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
