import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movies_app/src/data/model/discover_movie.dart';
import 'package:movies_app/src/data/model/movie.dart';
import 'package:movies_app/src/data/network/dio_service.dart';
import 'package:movies_app/src/data/network/movie_api.dart';

final movieRepository = Provider<MovieRepository>((ref) => MovieRepositoryImpl(
      movieApi: DioService().movieApi,
    ));

abstract class MovieRepository {
  Future<DiscoverMovie> getDiscoverMovie({required CancelToken cancelToken});

  Future<Movie> getMovie({required int id, required CancelToken cancelToken});
}

class MovieRepositoryImpl implements MovieRepository {
  final MovieApi _movieApi;

  const MovieRepositoryImpl({
    required MovieApi movieApi,
  }) : _movieApi = movieApi;

  @override
  Future<DiscoverMovie> getDiscoverMovie({required CancelToken cancelToken}) =>
      _movieApi.getDiscoverMovie(cancelToken: cancelToken);

  @override
  Future<Movie> getMovie({required int id, required CancelToken cancelToken}) => _movieApi.getMovie(
        id: id,
        cancelToken: cancelToken,
      );
}
