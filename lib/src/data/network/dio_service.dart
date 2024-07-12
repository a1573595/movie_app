import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movies_app/configs.dart';
import 'package:movies_app/src/data/network/movie_api.dart';

class DioService {
  static final DioService _instance = DioService._();

  factory DioService() => _instance;

  late final MovieApi _movieApi;

  MovieApi get movieApi => _movieApi;

  DioService._() {
    final dio = Dio(BaseOptions(
      baseUrl: "https://api.themoviedb.org/",
      headers: {
        Headers.contentTypeHeader: Headers.jsonContentType,
      },
    ))
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers[HttpHeaders.authorizationHeader] = 'Bearer ${Configs.apiKey}';
          return handler.next(options);
        },
      ));

    _movieApi = MovieApiImpl(dio: dio);
  }
}
