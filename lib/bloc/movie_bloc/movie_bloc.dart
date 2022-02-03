import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movieapp/bloc/movie_bloc/events/change_layout.dart';
import 'package:movieapp/bloc/movie_bloc/events/get_movie.dart';
import 'package:movieapp/bloc/movie_bloc/events/get_similar_movies.dart';
import 'package:movieapp/bloc/movie_bloc/events/movie_event.dart';
import 'package:movieapp/bloc/movie_bloc/events/request_specific_type.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_failure.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_initial.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_loaded.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_loaded_grid.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_loading.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_state.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/data/repository/movie_repository.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieReposiotry reposiotry = MovieReposiotry();
  List<Movie>  upCommingmovies = [];
  List<Movie> topRatedmovies = [];
  List<Movie> Popularmovies = [];
  List<Movie> Similarmovies =[] ;
  int UpCommingpageNumber = 1;
  int TopRatedpageNumber = 1;
  int PopularpageNumber = 1;


  final _upComingController = StreamController<List<Movie>>.broadcast();
  Stream<List<Movie>> get upComingMoviesStream => _upComingController.stream;

  final _topRatedController = StreamController<List<Movie>>.broadcast();
  Stream<List<Movie>> get topRatedMoviesStream => _topRatedController.stream;
  final _popularController = StreamController<List<Movie>>.broadcast();
  Stream<List<Movie>> get popularMoviesStream => _popularController.stream;




  bool isUpdate = false;


  MovieBloc(this.reposiotry) : super(InitialMovie());



  @override
  void dispose(){
    _upComingController.close();
    _popularController.close();
    _topRatedController.close();
  }


  void getUpComngMoves()async
  {
    UpCommingpageNumber++;
    isUpdate = true;
    upCommingmovies.addAll(await reposiotry.getUpCommingMovies(UpCommingpageNumber));
    _upComingController.sink.add(upCommingmovies);
    isUpdate = false;
  }

  void getTopMovies()async
  {
    TopRatedpageNumber++;
    isUpdate = true;
    topRatedmovies.addAll(await reposiotry.getTopRatedMovies(TopRatedpageNumber));
    _topRatedController.sink.add(topRatedmovies);
    isUpdate = false;
  }

  void getPopularMovies()async
  {
    PopularpageNumber;
    isUpdate = true;
    Popularmovies.addAll(await reposiotry.getPopularMovies(PopularpageNumber));
    _popularController.sink.add(Popularmovies);
    isUpdate = false;
  }


  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is RequestMovie) {
      yield LoadingMovie();
      try {
          upCommingmovies.addAll(await reposiotry.getUpCommingMovies(UpCommingpageNumber));
          _upComingController.sink.add(upCommingmovies);


          topRatedmovies.addAll(await reposiotry.getTopRatedMovies(TopRatedpageNumber));
          _topRatedController.sink.add(topRatedmovies);


          Popularmovies.addAll(await reposiotry.getPopularMovies(PopularpageNumber));
          _popularController.sink.add(Popularmovies);


          yield LoadedMovie(Upcomingmovies:upCommingmovies , TopRatedmovies: topRatedmovies  , Popularmovies: Popularmovies  );

      } catch (e) {
       yield FailureMovie(error: e.toString());
      }
    }

    if(event is GetSimilarMovies)
      {
        yield LoadingMovie();
        try{
          final Similarmovies = await reposiotry.getSimilarMovies(event.id);
          yield LoadedMovie( Similarmovies: Similarmovies);
        }catch(e){
         yield FailureMovie(error: e.toString());
        }
      }

    if (event is ChangeLayout) {
      yield LoadingMovie();
      try {
        if(upCommingmovies.isEmpty)
        {
         upCommingmovies = await reposiotry.getUpCommingMovies(UpCommingpageNumber);
         _upComingController.sink.add(upCommingmovies);
        }
        if(topRatedmovies.isEmpty)
        {
          topRatedmovies = await reposiotry.getTopRatedMovies(TopRatedpageNumber);
        }
        if(Popularmovies.isEmpty)
        {
          Popularmovies = await reposiotry.getPopularMovies(PopularpageNumber);
        }
        yield MovieLoadedGrid( Upcomingmovies:upCommingmovies , TopRatedmovies: topRatedmovies  , Popularmovies: Popularmovies  );
      } catch (e) {
        yield FailureMovie(error: e.toString());
      }
    }
  }
}

//1)
//2)