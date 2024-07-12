import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  @JsonKey(name: "poster_path")
  final String posterPath;
  final int id;
  final String overview;
  final String title;

  const Movie({
    required this.posterPath,
    required this.id,
    required this.overview,
    required this.title,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
