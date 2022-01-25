import 'package:bloc/bloc.dart';
import 'package:movieapp/bloc/movie_bloc/events/change_layout.dart';
import 'package:movieapp/bloc/movie_bloc/events/get_movie.dart';
import 'package:movieapp/bloc/movie_bloc/events/get_similar_movies.dart';
import 'package:movieapp/bloc/movie_bloc/events/movie_event.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_failure.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_initial.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_loaded.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_loaded_grid.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_loading.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_state.dart';
import 'package:movieapp/bloc/reviews_bloc/events/get_reviews.dart';
import 'package:movieapp/bloc/reviews_bloc/events/reviews_event.dart';
import 'package:movieapp/bloc/reviews_bloc/states/review_failure.dart';
import 'package:movieapp/bloc/reviews_bloc/states/review_initial.dart';
import 'package:movieapp/bloc/reviews_bloc/states/review_loaded.dart';
import 'package:movieapp/bloc/reviews_bloc/states/review_loading.dart';
import 'package:movieapp/bloc/reviews_bloc/states/review_state.dart';
import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/data/repository/movie_repository.dart';
import 'package:movieapp/data/repository/reviews_repository.dart';

class ReviewBloc extends Bloc<ReviewsEvent, ReviewState> {
  ReviewsReposiotry reposiotry = ReviewsReposiotry();



  ReviewBloc(this.reposiotry) : super(InitialReview());

  @override
  Stream<ReviewState> mapEventToState(ReviewsEvent event) async* {
    if (event is RequestReviews) {
      yield LoadingReviews();
      try {
        final reviews = await reposiotry.getMoviesReviews(event.id.toString());
        yield LoadedReview(reviews: reviews);
      } catch (e) {
        yield FailureReview(error: e.toString());
      }
    }

  }
}

//1)socket exception
//2)should call one time