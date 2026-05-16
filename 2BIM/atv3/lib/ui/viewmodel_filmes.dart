import 'package:lumberdash/lumberdash.dart';
import 'package:filmes/dados/modelos/favorito.dart';
import 'package:filmes/dados/modelos/genero.dart';
import 'package:filmes/dados/modelos/creditos_filme.dart';
import 'package:filmes/dados/modelos/detalhes_filme.dart';
import 'package:filmes/dados/modelos/resposta_filmes.dart';
import 'package:filmes/dados/modelos/resultado_filme.dart';
import 'package:filmes/dados/modelos/videos_filme.dart';
import 'package:filmes/rede/servico_api_filmes.dart';

class ViewModelFilmes {
  final ServicoApiFilmes servicoApiFilmes;
  List<Genero>? generosFilmes;
  Stream<List<Favorito>>? streamFavoritos;
  List<Favorito>? listaFavoritos;
  List<ResultadoFilme> filmesEmAlta = [];
  List<ResultadoFilme> filmesMaisBemAvaliados = [];
  List<ResultadoFilme> filmesPopulares = [];
  List<ResultadoFilme> filmesEmCartaz = [];

  ViewModelFilmes({required this.servicoApiFilmes});

  Future configurar() async {
    await Future.wait([configurarApp(), configurarGeneros()]);
  }

  Future configurarApp() async {}

  Future configurarGeneros() async {
    final response = await servicoApiFilmes.buscarGeneros();
    if (response.statusCode == 200) {
      generosFilmes = Generos.fromJson(response.data).genres;
    } else {
      logError(
          'Falha ao carregar generos com erro ${response.statusCode} e mensagem ${response.statusMessage}');
    }
  }

  Stream<List<Favorito>> fluxoFavoritos() {
    listaFavoritos ??= [
      Favorito(
          movieId: 1,
          image:
              'http://image.tmdb.org/t/p/w780/z1p34vh7dEOnLDmyCrlUVLuoDzd.jpg',
          favorite: false,
          title: 'Title',
          overview: 'Overview',
          popularity: 1.0,
          releaseDate: DateTime.now()),
      Favorito(
          movieId: 2,
          image:
              'http://image.tmdb.org/t/p/w780/gKkl37BQuKTanygYQG1pyYgLVgf.jpg',
          favorite: false,
          title: 'Title',
          overview: 'Overview',
          popularity: 1.0,
          releaseDate: DateTime.now()),
      Favorito(
          movieId: 3,
          image:
              'http://image.tmdb.org/t/p/w780/4xJd3uwtL1vCuZgEfEc8JXI9Uyx.jpg',
          favorite: false,
          title: 'Title',
          overview: 'Overview',
          popularity: 1.0,
          releaseDate: DateTime.now()),
      Favorito(
          movieId: 4,
          image:
              'http://image.tmdb.org/t/p/w780/uuA01PTtPombRPvL9dvsBqOBJWm.jpg',
          favorite: false,
          title: 'Title',
          overview: 'Overview',
          popularity: 1.0,
          releaseDate: DateTime.now()),
      Favorito(
          movieId: 5,
          image:
              'http://image.tmdb.org/t/p/w780/H6vke7zGiuLsz4v4RPeReb9rsv.jpg',
          favorite: false,
          title: 'Title',
          overview: 'Overview',
          popularity: 1.0,
          releaseDate: DateTime.now()),
    ];
    streamFavoritos = Stream.value(listaFavoritos!);
    return streamFavoritos!;
  }

  void atualizarFavorito(Favorito favorite) {
    final index = listaFavoritos!
        .indexWhere((itemFavorito) => itemFavorito.movieId == favorite.movieId);
    if (index != -1) {
      listaFavoritos![index] = favorite;
    }
  }


  Future<RespostaFilmes?> getTrendingMovies(int page) async {
    final response = await servicoApiFilmes.buscarEmAlta(page);
    if (response.statusCode == 200) {
      var respostaFilmes = RespostaFilmes.fromJson(response.data);
      filmesEmAlta = respostaFilmes.results;
      return respostaFilmes;
    } else {
      logError(
          'Falha ao carregar filmes com erro ${response.statusCode} e mensagem ${response.statusMessage}');
      return null;
    }
  }

  Future<RespostaFilmes?> buscarPopulares(int page) async {
    final response = await servicoApiFilmes.buscarPopulares(page);
    if (response.statusCode == 200) {
      var respostaFilmes = RespostaFilmes.fromJson(response.data);
      filmesPopulares = respostaFilmes.results;
      return respostaFilmes;
    } else {
      logError(
          'Falha ao carregar filmes com erro ${response.statusCode} e mensagem ${response.statusMessage}');
      return null;
    }
  }

  Future<RespostaFilmes?> buscarMaisBemAvaliados(int page) async {
    final response = await servicoApiFilmes.buscarMaisBemAvaliados(page);
    if (response.statusCode == 200) {
      var respostaFilmes = RespostaFilmes.fromJson(response.data);
      filmesMaisBemAvaliados = respostaFilmes.results;
      return respostaFilmes;
    } else {
      logError(
          'Falha ao carregar filmes com erro ${response.statusCode} e mensagem ${response.statusMessage}');
      return null;
    }
  }

  Future<RespostaFilmes?> buscarEmCartaz(int page) async {
    final response = await servicoApiFilmes.buscarEmCartaz(page);
    if (response.statusCode == 200) {
      var respostaFilmes = RespostaFilmes.fromJson(response.data);
      filmesEmCartaz = respostaFilmes.results;
      return respostaFilmes;
    } else {
      logError(
          'Falha ao carregar filmes com erro ${response.statusCode} e mensagem ${response.statusMessage}');
      return null;
    }
  }

  Future<DetalhesFilme?> buscarDetalhesFilme(int movieId) async {
    final response = await servicoApiFilmes.buscarDetalhesFilme(movieId);
    if (response.statusCode == 200) {
      try {
        return DetalhesFilme.fromJson(response.data);
      } catch (e) {
        logError('Falha ao decodificar detalhes do filme com erro $e');
        return null;
      }
    } else {
      logError(
          'Falha ao carregar detalhes do filme com erro ${response.statusCode} e mensagem ${response.statusMessage}');
      return null;
    }
  }

  Future<VideosFilme?> buscarVideosFilme(int movieId) async {
    final response = await servicoApiFilmes.buscarVideosFilme(movieId);
    if (response.statusCode == 200) {
      try {
        return VideosFilme.fromJson(response.data);
      } catch (e) {
        logError('Falha ao decodificar videos do filme com erro $e');
        return null;
      }
    } else {
      logError(
          'Falha ao carregar videos do filme com erro ${response.statusCode} e mensagem ${response.statusMessage}');
      return null;
    }
  }

  Future<CreditosFilme?> buscarCreditosFilme(int movieId) async {
    final response = await servicoApiFilmes.buscarCreditosFilme(movieId);
    if (response.statusCode == 200) {
      try {
        return CreditosFilme.fromJson(response.data);
      } catch (e) {
        logError('Falha ao decodificar creditos do filme com erro $e');
        return null;
      }
    } else {
      logError(
          'Falha ao carregar creditos do filme com erro ${response.statusCode} e mensagem ${response.statusMessage}');
      return null;
    }
  }

  Future<RespostaFilmes?> pesquisarFilmesPorGenero(String genres, int page) async {
    final response = await servicoApiFilmes.pesquisarFilmesPorGenero(genres, page);
    if (response.statusCode == 200) {
      var respostaFilmes = RespostaFilmes.fromJson(response.data);
      return respostaFilmes;
    } else {
      logError(
          'Falha ao carregar filmes com erro ${response.statusCode} e mensagem ${response.statusMessage}');
      return null;
    }
  }

  Future<RespostaFilmes?> pesquisarFilmes(String textoBusca, int page) async {
    final response = await servicoApiFilmes.pesquisarFilmes(textoBusca, page);
    if (response.statusCode == 200) {
      var respostaFilmes = RespostaFilmes.fromJson(response.data);
      return respostaFilmes;
    } else {
      logError(
          'Falha ao carregar filmes com erro ${response.statusCode} e mensagem ${response.statusMessage}');
      return null;
    }
  }
}
