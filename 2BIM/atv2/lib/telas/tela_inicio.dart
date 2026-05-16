import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/filme_item.dart';
import '../models/tema_item.dart';
import '../roteador/rotas_app.gr.dart';
import '../widgets/filmes_listview.dart';
import '../widgets/temas_gridview.dart';

const List<TemaItem> _temas = <TemaItem>[
  TemaItem(
    nome: 'Ação',
    imageUrl: 'https://picsum.photos/seed/acao/500/350',
    cor: Color(0xFF264653),
  ),
  TemaItem(
    nome: 'Comédia',
    imageUrl: 'https://picsum.photos/seed/comedia/500/350',
    cor: Color(0xFF2A9D8F),
  ),
  TemaItem(
    nome: 'Drama',
    imageUrl: 'https://picsum.photos/seed/drama/500/350',
    cor: Color(0xFFE76F51),
  ),
  TemaItem(
    nome: 'Ficção Científica',
    imageUrl: 'https://picsum.photos/seed/ficcao/500/350',
    cor: Color(0xFF1D3557),
  ),
  TemaItem(
    nome: 'Suspense',
    imageUrl: 'https://picsum.photos/seed/suspense/500/350',
    cor: Color(0xFF6A4C93),
  ),
  TemaItem(
    nome: 'Animação',
    imageUrl: 'https://picsum.photos/seed/animacao/500/350',
    cor: Color(0xFFF4A261),
  ),
];

@RoutePage(name: 'TelaInicioRoute')
class TelaInicio extends StatefulWidget {
  const TelaInicio({super.key});

  @override
  State<TelaInicio> createState() => _TelaInicioState();
}

class _TelaInicioState extends State<TelaInicio> {
  late final Future<List<FilmeItem>> _filmesFuturo = _carregarFilmes();

  Future<List<FilmeItem>> _carregarFilmes() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/filmes.json',
    );
    final List<dynamic> dados = jsonDecode(jsonString) as List<dynamic>;
    return dados
        .cast<Map<String, dynamic>>()
        .map(FilmeItem.fromJson)
        .toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogo de Filmes'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<List<FilmeItem>>(
          future: _filmesFuturo,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}'));
            }
            final filmes = snapshot.data ?? const <FilmeItem>[];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    'Temas',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(flex: 1, child: TemasGridView(temas: _temas)),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Text(
                    'Filmes em Destaque',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: FilmesListView(
                    filmes: filmes,
                    onTap: (filme) =>
                        context.router.push(TelaDetalhesFilmeRoute(filme: filme)),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
