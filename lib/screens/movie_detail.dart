import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/bloc/events/get_movie.dart';
import 'package:movieapp/bloc/events/get_similar_movies.dart';
import 'package:movieapp/bloc/movie_bloc.dart';
import 'package:movieapp/bloc/states/movie_failure.dart';
import 'package:movieapp/bloc/states/movie_loaded.dart';
import 'package:movieapp/bloc/states/movie_loading.dart';
import 'package:movieapp/bloc/states/movie_state.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/data/repository/movie_repository.dart';
import 'package:movieapp/widgets/app_bar_container.dart';
import 'package:movieapp/widgets/movie_list_view.dart';

class MovieDetail extends StatelessWidget {
  Movie? movie;
  MovieDetail({this.movie});
  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: const AppBarGradient(),
          title: Text(movie!.title!.toUpperCase()),
        ),
        body: BlocProvider(
            create: (BuildContext context)=>MovieBloc(
                RepositoryProvider.of<MovieReposiotry>(context)
            )..add(GetSimilarMovies(id: movie!.id.toString())),
          child: SingleChildScrollView(
            child: Container(
                height: height,
                width: width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.red, Colors.black, Colors.black]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: width! * 0.4,
                            height: height! * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    image: NetworkImage( "https://image.tmdb.org/t/p/w500/"+movie!.poster_path!),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie!.title!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(
                              height: height! * 0.05,
                            ),
                            Text(
                              movie!.vote_count!.toString() + " Votes",
                              style:const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Text(
                              movie!.popularity!.toString() + " Popularity",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Text(
                              movie!.adult! + " Adult",
                              style:const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Container(
                              width: width! * 0.2,
                              child: Row(
                                children: const[
                                  Icon(Icons.forward),
                                  Text('Play'),
                                ],
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12), // <-- Radius
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.download_outlined,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        movie!.overview!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),

                   BlocConsumer<MovieBloc , MovieState>(

                       builder: (context , state){

                         if(state is LoadingMovie)
                         {
                           return Center(
                               child: CircularProgressIndicator(),
                             );
                         }
                         if(state is LoadedMovie)
                         {

                           return MovieListView(title: "More Like This",movies:state.Similarmovies!);
                         }

                         if(state is FailureMovie)
                         {
                           return Center(
                             child: Text(state.error.toString()),
                           );
                         }


                         return Container();
                       },

                     listener: (context , state){

                       if(state is LoadingMovie)
                       {
                         ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(content: Text("LOADING YOUR MOVIES") , backgroundColor: Colors.red,)
                         );
                       }
                       if(state is LoadedMovie)
                       {
                         ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(content: Text("Loaded Your Movies") , backgroundColor: Colors.grey,)
                         );
                       }

                     },


                   )



                   // MovieListView(title: "More Like These - Movies",movies: m,),




                  ],
                )),
          ),
        ));
  }
}
