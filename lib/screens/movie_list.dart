import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_model.dart';
import 'package:movieapp/screens/movie_grid.dart';
import 'package:movieapp/widgets/movie_component_grid.dart';
import 'package:movieapp/widgets/movie_widget.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}



class _MovieListState extends State<MovieList> {

  Movie movie =  Movie();
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
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient:
            LinearGradient(
                begin: Alignment.topLeft,
                end:
                Alignment.bottomRight,

                colors: [ Colors.red,Colors.black]),
          ),

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0 , top: 10),
                child: Text("Most Popular - Movies" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 20),),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.40,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (context,index){
                      return  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageComponentGrid(movie: movies[index],),
                      );
                    }),
              ),





              Padding(
                padding: const EdgeInsets.only(left: 20.0 , top: 10),
                child: Text("Most Popular - Movies" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 20),),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.40,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (context,index){
                      return  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageComponentGrid(movie: movies[index],),
                      );
                    }),
              ),






              Padding(
                padding: const EdgeInsets.only(left: 20.0 , top: 10),
                child: Text("Most Popular - Movies" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 20),),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.40,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (context,index){
                      return  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageComponentGrid(movie: movies[index],),
                      );
                    }),
              ),





              Padding(
                padding: const EdgeInsets.only(left: 20.0 , top: 10),
                child: Text("Most Popular - Movies" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 20),),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.40,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (context,index){
                      return  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ImageComponentGrid(movie: movies[index],),
                      );
                    }),
              ),
            ],
          ),
        ),
      )
    );
  }
}
