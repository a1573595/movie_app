// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      posterPath: json['poster_path'] as String,
      id: (json['id'] as num).toInt(),
      overview: json['overview'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'poster_path': instance.posterPath,
      'id': instance.id,
      'overview': instance.overview,
      'title': instance.title,
    };
