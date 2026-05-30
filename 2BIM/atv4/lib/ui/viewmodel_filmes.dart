import 'package:lumberdash/lumberdash.dart';
import 'package:filmes/dados/banco/banco_dados.dart';
import 'package:filmes/dados/modelos/genero.dart';
import 'package:filmes/dados/modelos/creditos_filme.dart';
import 'package:filmes/dados/modelos/detalhes_filme.dart';
import 'package:filmes/dados/modelos/resposta_filmes.dart';
import 'package:filmes/dados/modelos/resultado_filme.dart';
import 'package:filmes/dados/modelos/videos_filme.dart';
import 'package:filmes/rede/servico_api_filmes.dart';

class ViewModelFilmes {
  final ServicoApiFilmes servicoApiFilmes;
  final BancoDados banco;
  List<Genero>? generosFilmes;
  List<ResultadoFilme> filmesEmAlta = [];
  List<ResultadoFilme> filmesMaisBemAvaliados = [];
  List<ResultadoFilme> filmesPopulares = [];
  List<ResultadoFilme> filmesEmCartaz = [];

  ViewModelFilmes({required this.servicoApiFilmes, required this.banco});

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

  // Fluxo dos favoritos lido diretamente do banco local (Drift/SQLite).
  Stream<List<Favorito>> fluxoFavoritos() => banco.observarFavoritos();

  // Observa se um filme esta favoritado (usado na tela de detalhes).
  Stream<bool> observarFavorito(int movieId) => banco.observarFavorito(movieId);

  // Salva um filme como favorito no banco.
  Future<void> favoritar(Favorito favorito) => banco.inserirFavorito(favorito);

  // Remove o filme dos favoritos no banco.
  Future<void> desfavoritar(int movieId) => banco.removerFavorito(movieId);

  // Monta um Favorito a partir dos detalhes do filme para persistir no banco.
  Favorito favoritoDeDetalhes(DetalhesFilme detalhes, String urlImagem) {
    return Favorito(
      movieId: detalhes.id,
      image: urlImagem,
      favorite: true,
      title: detalhes.title,
      overview: detalhes.overview,
      popularity: detalhes.popularity,
      releaseDate: detalhes.releaseDate,
    );
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
