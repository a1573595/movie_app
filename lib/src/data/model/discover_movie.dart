import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/src/data/model/movie.dart';

part 'discover_movie.g.dart';

@JsonSerializable()
class DiscoverMovie {
  final int page;
  final List<Movie> results;

  const DiscoverMovie({
    required this.page,
    required this.results,
  });

  factory DiscoverMovie.fromJson(Map<String, dynamic> json) => _$DiscoverMovieFromJson(json);
}
