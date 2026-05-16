import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const String urlApiFilmes = 'https://api.themoviedb.org/3/';
const urlGeneros = 'genre/movie/list';
const urlEmAlta = 'trending/movie/week';
const urlEmCartaz = 'movie/now_playing';
const urlMaisBemAvaliados = 'movie/top_rated';
const urlPopulares = 'movie/popular';
const urlPesquisarFilmes = 'search/movie';
const urlDescobrirFilmes = 'discover/movie';
const urlFilme = 'movie';
const urlConfiguracao = 'configuration';
const parametroCreditos = 'credits';
const parametroVideos = 'videos';
const nomeParametroConsulta = 'query';
const nomeParametroGenero = 'with_genres';
const nomeParametroPagina = 'page';
const nomeParametroIdFilme = 'movie_id';
const nomeParametroChaveApi = 'api_key';

class ServicoApiFilmes {
  late final Dio dio;
  final String chaveApi = dotenv.env['TMDB_KEY'] ?? '';
  final mostrarInfoDebug = false;

  ServicoApiFilmes() {
    configurarDio();
  }

  void configurarDio() {
    final options = BaseOptions(
      baseUrl: urlApiFilmes,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    dio = Dio(options);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          final queryParameters = options.queryParameters;
          if (chaveApi.isNotEmpty) {
            queryParameters[nomeParametroChaveApi] = chaveApi;
          }
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // you can reject a `DioException` object using `handler.reject(dioError)`.
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          // you can resolve a `Response` object using `handler.resolve(response)`.
          return handler.next(error);
        },
      ),
    );
    if (mostrarInfoDebug) {
      dio.interceptors.add(LogInterceptor(
        responseBody: true,
        error: true,
        request: true,
        requestHeader: true,
        responseHeader: true,
      ));
    }
  }

  Future<Response> buscarEmAlta([int page = 1]) async {
    final response =
        await dio.get(urlEmAlta, queryParameters: {nomeParametroPagina: page});
    return response;
  }

  Future<Response> buscarEmCartaz([int page = 1]) async {
    final response = await dio
        .get(urlEmCartaz, queryParameters: {nomeParametroPagina: page});
    return response;
  }

  Future<Response> buscarMaisBemAvaliados([int page = 1]) async {
    final response =
        await dio.get(urlMaisBemAvaliados, queryParameters: {nomeParametroPagina: page});
    return response;
  }

  Future<Response> buscarPopulares([int page = 1]) async {
    final response =
        await dio.get(urlPopulares, queryParameters: {nomeParametroPagina: page});
    return response;
  }

  Future<Response> buscarDetalhesFilme(int movieId) async {
    return dio.get('$urlFilme/$movieId');
  }

  Future<Response> buscarVideosFilme(int movieId) async {
    return dio.get('$urlFilme/$movieId/$parametroVideos');
  }

  Future<Response> buscarCreditosFilme(int movieId) async {
    return dio.get('$urlFilme/$movieId/$parametroCreditos');
  }

  Future<Response> buscarGeneros() async {
    final response = await dio.get(urlGeneros);
    return response;
  }

  Future<Response> pesquisarFilmes(String query, [int page = 1]) async {
    return dio
        .get(urlPesquisarFilmes, queryParameters: {nomeParametroConsulta: query});
  }

  Future<Response> pesquisarFilmesPorGenero(String genre, [int page = 1]) async {
    return dio.get(urlDescobrirFilmes,
        queryParameters: {nomeParametroGenero: genre, nomeParametroPagina: page});
  }

  Future<Response> buscarConfiguracaoFilmes() async {
    return dio.get(urlConfiguracao);
  }
}
