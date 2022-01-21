
import 'package:json_annotation/json_annotation.dart';

part "movie.g.dart";


@JsonSerializable()
class Movie
{
  String? title;
  String? poster_path;
  String? adult;
  String? overview;
  String?release_date;
  String? vote_average;
  String? popularity;
  String? vote_count;

  Movie({this.title,this.adult,this.overview,this.popularity,this.poster_path,this.release_date,this.vote_average,this.vote_count});
  //
  // factory Movie.fromJson(Map<String, dynamic> json) =>
  //     _$MovieFromJson(json);
  //
  factory Movie.fromJson(Map<String, dynamic> json)=> Movie(
    title: json["title"].toString(),
    adult: json["adult"].toString(),
    overview: json["overview"].toString(),
    poster_path: json["poster_path"].toString(),
    popularity: json["popularity"].toString(),
    release_date: json["release_date"].toString(),
    vote_average: json["vote_average"].toString(),
    vote_count: json["vote_count"].toString(),

  );

  Map<String, dynamic> toJson() => _$MovieToJson(this);


}