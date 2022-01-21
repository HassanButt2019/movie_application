import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/bloc/events/get_movie.dart';
import 'package:movieapp/bloc/movie_bloc.dart';
import 'package:movieapp/bloc/states/movie_failure.dart';
import 'package:movieapp/bloc/states/movie_initial.dart';
import 'package:movieapp/bloc/states/movie_loaded.dart';
import 'package:movieapp/bloc/states/movie_loading.dart';
import 'package:movieapp/bloc/states/movie_state.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/data/repository/movie_repository.dart';
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
    return BlocProvider(
        create: (BuildContext context)=>MovieBloc(
            RepositoryProvider.of<MovieReposiotry>(context)
        )..add(RequestMovie()),
      child: BlocConsumer<MovieBloc , MovieState>(
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
          builder: (context , state){

            if(state is InitialMovie)
              {
                return Scaffold(
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
                    child: Center(
                      child: Text("Welcome To Movie Land"),
                    ),
                  ),
                );
              }

            if(state is LoadingMovie)
              {
                return Scaffold(
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
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }

            if(state is LoadedMovie)
              {
                print(state.movies[0].title);
                return Scaffold(
                      appBar: AppBar(
                        title: const Text("Movie List"),
                        flexibleSpace:const AppBarGradient(),
                        actions: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieGrid(movies:state.movies ,)));

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
                           CrausalWidget(movies: state.movies,),
                          MovieListView(title: "Recently Added - Movies",movies:state.movies),
                           MovieListView(title: "Most Popular - Movies",movies: List.from(state.movies.reversed),),
                           MovieListView(title: "Your Favourite - Movies",movies: state.movies,),


                        ],
                      ),
                    ),
                  ),
                );
              }
            if(state is FailureMovie)
              {
                return Center(
                  child: Text(state.error.toString()),
                );
              }
            return Container();
          },
        )
        );
  }
}
