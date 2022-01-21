
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

  Future<List<Movie>>  getMovies() async
  {
    print("HELLO WORLD");
    http.Response rawData = await _provider.getMovies();
  //  print(rawData.body);
    var json = jsonDecode(rawData.body) ;
    List<Movie> data = json["results"].map<Movie>((model) => Movie.fromJson(model)).toList();


    return data;
  }
}