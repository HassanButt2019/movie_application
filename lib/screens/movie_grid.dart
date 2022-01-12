
import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/widgets/movie_component_grid.dart';

class MovieGrid extends StatefulWidget {
  MovieGrid({this.id});
  int? id;
  @override
  _MovieGridState createState() => _MovieGridState();
}

class _MovieGridState extends State<MovieGrid> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Movie Grid"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient:
          LinearGradient(
              begin: Alignment.topLeft,
              end:
              Alignment.bottomRight,

              colors: [ Colors.red,Colors.black,Colors.black]),
        ),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,

                childAspectRatio: 3 / 5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: movies.length,
            itemBuilder: (BuildContext ctx, index) {
              return ImageComponentGrid(movie:movies[index]);
            }),
      ),
    );
  }
}
