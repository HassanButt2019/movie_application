import 'package:bloc/bloc.dart';
import 'package:movieapp/bloc/events/get_movie.dart';
import 'package:movieapp/bloc/events/movie_event.dart';
import 'package:movieapp/bloc/states/movie_failure.dart';
import 'package:movieapp/bloc/states/movie_initial.dart';
import 'package:movieapp/bloc/states/movie_loaded.dart';
import 'package:movieapp/bloc/states/movie_loading.dart';
import 'package:movieapp/bloc/states/movie_state.dart';
import 'package:movieapp/data/repository/movie_repository.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieReposiotry reposiotry = MovieReposiotry();

  MovieBloc(this.reposiotry) : super(InitialMovie());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is RequestMovie) {
      yield LoadingMovie();

      try {
        final movies = await reposiotry.getMovies();
        yield LoadedMovie(movies: movies);
      } catch (e) {
        FailureMovie(error: e.toString());

      }
    }
  }
}
