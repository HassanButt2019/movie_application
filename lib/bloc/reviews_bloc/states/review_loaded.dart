
import 'package:movieapp/bloc/movie_bloc/states/movie_state.dart';
import 'package:movieapp/bloc/reviews_bloc/states/review_state.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/data/models/reviews.dart';

class LoadedReview extends ReviewState
{

  List<Author> reviews;


  LoadedReview({required this.reviews });
  @override
  // TODO: implement props
  List<Object?> get props => [reviews];

}