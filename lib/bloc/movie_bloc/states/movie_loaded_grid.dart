
import 'package:movieapp/bloc/movie_bloc/states/movie_state.dart';
import 'package:movieapp/data/models/movie.dart';

class MovieLoadedGrid extends MovieState
{

  List<Movie>? Upcomingmovies;
  List<Movie>? TopRatedmovies;

  List<Movie>? Popularmovies;
  List<Movie>? Similarmovies;




  MovieLoadedGrid({this.TopRatedmovies ,this.Upcomingmovies , this.Popularmovies , this.Similarmovies});
  @override
  // TODO: implement props
  List<Object?> get props => [ TopRatedmovies , Upcomingmovies, Popularmovies , Similarmovies];

}