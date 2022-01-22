
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import 'dart:convert';

import 'package:movieapp/data/data_provider/movie_data_provider.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/data/models/movie.dart';

class MovieReposiotry
{
  final MovieDataProvider _provider = MovieDataProvider();

  Future<List<Movie>>  getUpCommingMovies() async
  {
    print("HELLO Upcomming");
    http.Response rawData = await _provider.getUpcomingMovies();
    final json = jsonDecode(rawData.body) ;
    List<Movie> data = json["results"].map<Movie>((model) => Movie.fromJson(model)).toList();
    return data;
  }


  Future<List<Movie>>  getTopRatedMovies() async
  {
    print("HELLO TopRated");
    http.Response rawData = await _provider.getTopRatedMovies();
    final json = jsonDecode(rawData.body) ;
    List<Movie> data = json["results"].map<Movie>((model) => Movie.fromJson(model)).toList();
    return data;
  }



  Future<List<Movie>>  getPopularMovies() async
  {
    print("HELLO Popular");
    http.Response rawData = await _provider.getPopularMovies();
    final json = jsonDecode(rawData.body) ;
    List<Movie> data = json["results"].map<Movie>((model) => Movie.fromJson(model)).toList();
    return data;
  }

  Future<List<Movie>>  getSimilarMovies(String id) async
  {
    print("HELLO Similar");
    http.Response rawData = await _provider.getSimilarMovies(id);
    final json = jsonDecode(rawData.body) ;


    List<Movie> data = json["results"].map<Movie>((model) => Movie.fromJson(model)).toList();

    return data;
  }
}