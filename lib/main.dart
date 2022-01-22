import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/data/repository/movie_repository.dart';
import 'package:movieapp/glitches/error_404.dart';
import 'package:movieapp/screens/movie_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context)=>MovieReposiotry(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        // onGenerateRoute: (settings){
        //   if(settings.name == "/")
        //     {
        //       return MaterialPageRoute(builder: (context)=>MovieList());
        //     }
        //
        //
        //   var uri = Uri.parse(settings.name.toString());
        //
        //   if (uri.pathSegments.length == 2 &&
        //       uri.pathSegments.first == 'MovieGridView') {
        //     var id = uri.pathSegments[1];
        //     return MaterialPageRoute(builder: (context) => MovieGrid(id: int.parse(id), movies: [],));
        //   }
        //
        //
        //
        //   return MaterialPageRoute(builder: (context) => Error404());
        //
        // },
        // routes: {
        //   "/":(context)=>MovieList(),
        //   "/MovieGridView":(context)=>MovieGrid(),
        // },
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const MovieList(),
      ),
    );
  }
}
