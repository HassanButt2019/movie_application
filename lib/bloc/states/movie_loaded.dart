
import 'package:movieapp/bloc/states/movie_state.dart';
import 'package:movieapp/data/models/movie.dart';

class LoadedMovie extends MovieState
{

  List<Movie> movies;
  LoadedMovie({required this.movies});
  @override
  // TODO: implement props
  List<Object?> get props => [movies];

}