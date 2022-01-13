import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/screens/movie_detail.dart';
import 'package:movieapp/screens/movie_grid.dart';
import 'package:movieapp/widgets/app_bar_container.dart';
import 'package:movieapp/widgets/carousal_widget.dart';
import 'package:movieapp/widgets/movie_component_grid.dart';
import 'package:movieapp/widgets/movie_list_view.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}



class _MovieListState extends State<MovieList> {

  Movie movie =  Movie();
  double? width , height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie List"),
        flexibleSpace:const AppBarGradient(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/MovieGridView/1');

            }, icon: Icon(Icons.grid_3x3_outlined , color: Colors.white,),),
        ],


      ),
      body: Container(
          height: height!,
          width: width!,
          decoration: const BoxDecoration(
            gradient:
            LinearGradient(
                begin: Alignment.topLeft,
                end:
                Alignment.bottomRight,
                colors: [ Colors.red,Colors.black,Colors.black]),
          ),

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const  CrausalWidget(),
              MovieListView(title: "Recently Added - Movies"),
              MovieListView(title: "Most Popular - Movies"),
              MovieListView(title: "Your Favourite - Movies"),


            ],
          ),
        ),
      )
    );
  }
}
