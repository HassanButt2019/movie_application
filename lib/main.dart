import 'package:flutter/material.dart';
import 'package:movieapp/screens/movie_grid.dart';
import 'package:movieapp/screens/movie_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/":(context)=>MovieList(),
        "/MovieGridView":(context)=>MovieGrid(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
   //   home: const MovieList(),
    );
  }
}
