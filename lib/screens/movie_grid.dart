
import 'package:flutter/material.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/screens/movie_detail.dart';
import 'package:movieapp/widgets/app_bar_container.dart';
import 'package:movieapp/widgets/movie_component_grid.dart';

class MovieGrid extends StatefulWidget {
  MovieGrid({this.id , required this.movies});
  int? id;
  List<Movie> movies;
  @override
  _MovieGridState createState() => _MovieGridState();
}

class _MovieGridState extends State<MovieGrid> {
  double?height;
  double?width;




  @override
  Widget build(BuildContext context) {
    print("HELLO");
    print(widget.movies);
    width = MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(

        title: Text("Movie Grid"),
        flexibleSpace: AppBarGradient(),
      ),
      body: Container(
        height: height,
        width: width,
        decoration:const BoxDecoration(
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
           itemCount: widget.movies.length,
            itemBuilder: (BuildContext ctx, index) {
              return ImageComponentGrid(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetail(movie:  widget.movies[index],)));

              },
                movie:widget.movies[index],widthProvided: 0.45,heigthProvided: 0.30,);
            }),
      ),
    );
  }
}
