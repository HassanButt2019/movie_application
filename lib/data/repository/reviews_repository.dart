



import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import 'dart:convert';

import 'package:movieapp/data/data_provider/movie_data_provider.dart';
import 'package:movieapp/data/data_provider/reviews_data_provider.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/data/models/reviews.dart';

class ReviewsReposiotry
{
  final ReviewsDataProvider _provider = ReviewsDataProvider();

  Future<List<Author>>  getMoviesReviews(String id) async
  {
    print("HELLO Reviews");
    http.Response rawData = await _provider.getMoviesReviews(id);
    final json = jsonDecode(rawData.body) ;
    List<Author> data = json["results"].map<Author>((model) => Author.fromJson(model)).toList();
   // print(data[0].author_details["avatar_path"]);
    return data;
  }
}