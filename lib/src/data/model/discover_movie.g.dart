// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoverMovie _$DiscoverMovieFromJson(Map<String, dynamic> json) =>
    DiscoverMovie(
      page: (json['page'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DiscoverMovieToJson(DiscoverMovie instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
