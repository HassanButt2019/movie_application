// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      title: json['title'] as String?,
      adult: json['adult'] as String?,
      overview: json['overview'] as String?,
      popularity: json['popularity'] as String?,
      poster_path: json['poster_path'] as String?,
      release_date: json['release_date'] as String?,
      vote_average: json['vote_average'] as String?,
      vote_count: json['vote_count'] as String?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'poster_path': instance.poster_path,
      'adult': instance.adult,
      'overview': instance.overview,
      'release_date': instance.release_date,
      'vote_average': instance.vote_average,
      'popularity': instance.popularity,
      'vote_count': instance.vote_count,
    };
