import 'package:flutter/material.dart';
import 'package:movieapp/screens/movie_grid.dart';
import 'package:movieapp/widgets/movie_widget.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}



class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie List"),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/MovieGridView/1');

        }, icon: Icon(Icons.grid_3x3_outlined , color: Colors.white,),),

      ),
      body: ListView(
        children: [

          MovieComponent(),
          MovieComponent(),
          MovieComponent(),
          MovieComponent()

        ],
      ),
    );
  }
}
