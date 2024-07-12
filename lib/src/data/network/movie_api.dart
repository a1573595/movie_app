import 'package:dio/dio.dart';
import 'package:movies_app/src/data/model/discover_movie.dart';
import 'package:movies_app/src/data/model/movie.dart';

abstract class MovieApi {
  Future<DiscoverMovie> getDiscoverMovie({required CancelToken cancelToken});

  Future<Movie> getMovie({required int id, required CancelToken cancelToken});
}

class MovieApiImpl implements MovieApi {
  final Dio _dio;

  const MovieApiImpl({required Dio dio}) : _dio = dio;

  @override
  Future<DiscoverMovie> getDiscoverMovie({required CancelToken cancelToken}) =>
      _dio.get("3/discover/movie", cancelToken: cancelToken).then((value) => DiscoverMovie.fromJson(value.data));

  @override
  Future<Movie> getMovie({required int id, required CancelToken cancelToken}) =>
      _dio.get("3/movie/$id", cancelToken: cancelToken).then((value) => Movie.fromJson(value.data));
}
