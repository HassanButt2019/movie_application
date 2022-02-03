//
//
//
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'package:mockito/mockito.dart';
//
//
// import 'dart:convert';
//
// import 'package:movieapp/data/data_provider/movie_data_provider.dart';
// import 'package:movieapp/data/models/movie.dart';
// import 'package:movieapp/data/models/movie.dart';
// import 'package:movieapp/data/models/movie.dart';
// import 'package:movieapp/data/repository/movie_repository.dart';
// class MockMovie extends Mock implements Movie{}
//
//
// class FakeMovieReposiotry implements MovieReposiotry
// {
//   Future<List<Movie>>  getUpCommingMovies(int id) async
//   {
//     return Future.delayed(
//       Duration(seconds: 1),
//           () {
//         return [Movie(id: "12") , Movie(id: "23")] ;
//       },
//     );
//   }
//
//   @override
//   Future<List<Movie>> getPopularMovies() {
//     return Future.delayed(
//       Duration(seconds: 1),
//           () {
//         return [Movie(id: "12") , Movie(id: "23")] ;
//       },
//     );
//   }
//
//   @override
//   Future<List<Movie>> getSimilarMovies(String id) {
//     // TODO: implement getSimilarMovies
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<List<Movie>> getTopRatedMovies() {
//     // TODO: implement getTopRatedMovies
//     throw UnimplementedError();
//   }
//
//
//   // Future<List<Movie>>  getTopRatedMovies() async
//   // {
//   //
//   // }
//   //
//   //
//   //
//   // Future<List<Movie>>  getPopularMovies() async
//   // {
//   //  = json["results"].map<Movie>((model) => Movie.fromJson(model)).toList();
//   //   return data;
//   // }
//   //
//   // Future<List<Movie>>  getSimilarMovies(String id) async
//   // {
//   //   print("HELLO Similar");
//   //   http.Response rawData = await _provider.getSimilarMovies(id);
//   //   final json = jsonDecode(rawData.body) ;
//   //
//   //
//   //   List<Movie> data = json["results"].map<Movie>((model) => Movie.fromJson(model)).toList();
//   //
//   //   return data;
//   // }
// }