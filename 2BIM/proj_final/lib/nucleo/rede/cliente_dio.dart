import 'package:dio/dio.dart';

import '../constantes.dart';

Dio criarClienteDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: Constantes.urlBaseApi,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      responseType: ResponseType.json,
    ),
  );

  dio.interceptors.add(LogInterceptor(requestBody: false, responseBody: false));
  return dio;
}
