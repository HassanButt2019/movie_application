
import 'package:flutter/material.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/screens/movie_detail.dart';
import 'package:movieapp/widgets/movie_component_grid.dart';


class MovieListView extends StatefulWidget {
  String? title;
  List<Movie> movies;
  MovieListView({this.title , required this.movies});

  @override
  _MovieListViewState createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  double?width;
  double?height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.0 , top: 10),
          child: Text(widget.title! , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 20),),
        ),
        Container(
          width: width,
          height:height!*0.35,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (context,index){
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageComponentGrid(
                   movie:  widget.movies[index],
                    onTap:  (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetail(movie:  widget.movies[index],)));
                    },

                  ),
                );
              }),
        ),
      ],
    );
  }
}
