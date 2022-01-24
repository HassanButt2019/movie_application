import 'package:bloc/bloc.dart';
import 'package:movieapp/bloc/events/change_layout.dart';
import 'package:movieapp/bloc/events/get_movie.dart';
import 'package:movieapp/bloc/events/get_similar_movies.dart';
import 'package:movieapp/bloc/events/movie_event.dart';
import 'package:movieapp/bloc/states/movie_failure.dart';
import 'package:movieapp/bloc/states/movie_initial.dart';
import 'package:movieapp/bloc/states/movie_loaded.dart';
import 'package:movieapp/bloc/states/movie_loaded_grid.dart';
import 'package:movieapp/bloc/states/movie_loading.dart';
import 'package:movieapp/bloc/states/movie_state.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/data/repository/movie_repository.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieReposiotry reposiotry = MovieReposiotry();
  List<Movie>?  upCommingmovies ;
  List<Movie>? topRatedmovies;

  List<Movie>? Popularmovies;
  List<Movie>? Similarmovies;


  MovieBloc(this.reposiotry) : super(InitialMovie());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is RequestMovie) {
      yield LoadingMovie();
      try {
          upCommingmovies = await reposiotry.getUpCommingMovies();

          topRatedmovies = await reposiotry.getTopRatedMovies();

          Popularmovies = await reposiotry.getPopularMovies();

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
        if(upCommingmovies!.isEmpty)
        {
          upCommingmovies = await reposiotry.getUpCommingMovies();
        }
        if(topRatedmovies!.isEmpty)
        {
          topRatedmovies = await reposiotry.getTopRatedMovies();
        }
        if(Popularmovies!.isEmpty)
        {
          Popularmovies = await reposiotry.getPopularMovies();
        }
        yield MovieLoadedGrid( Upcomingmovies:upCommingmovies , TopRatedmovies: topRatedmovies  , Popularmovies: Popularmovies  );
      } catch (e) {
        yield FailureMovie(error: e.toString());
      }
    }
  }
}

//1)socket exception
//2)should call one time