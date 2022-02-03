import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/bloc/movie_bloc/events/get_similar_movies.dart';
import 'package:movieapp/bloc/movie_bloc/movie_bloc.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_failure.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_loaded.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_loading.dart';
import 'package:movieapp/bloc/movie_bloc/states/movie_state.dart';
import 'package:movieapp/bloc/reviews_bloc/events/get_reviews.dart';
import 'package:movieapp/bloc/reviews_bloc/reviews_bloc.dart';
import 'package:movieapp/bloc/reviews_bloc/states/review_failure.dart';
import 'package:movieapp/bloc/reviews_bloc/states/review_loaded.dart';
import 'package:movieapp/bloc/reviews_bloc/states/review_loading.dart';
import 'package:movieapp/bloc/reviews_bloc/states/review_state.dart';

import 'package:movieapp/data/models/movie.dart';
import 'package:movieapp/data/repository/movie_repository.dart';
import 'package:movieapp/data/repository/reviews_repository.dart';
import 'package:movieapp/widgets/review_widget.dart';
import 'package:movieapp/widgets/similar_movie_widget.dart';

class MovieDetail extends StatelessWidget {
  Movie? movie;
  MovieDetail({this.movie});
  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.red, Colors.black, Colors.black]),
      ),
      child: Scaffold(
          backgroundColor: Colors.black,
          body: BlocProvider(
            create: (BuildContext context) =>
                MovieBloc(RepositoryProvider.of<MovieReposiotry>(context))
                  ..add(GetSimilarMovies(id: movie!.id.toString())),
            child: ListView(children: [
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: <Widget>[
                        MovieImage(),
                        ContainerGradient(),
                        BackArrowButton(context),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MovieTitle(),
                                MovieInformation(),
                              ],
                            ),
                          ),
                        ),
                      ]
                      ),
                      MovieOverview(),
                    ],
                  ),
                ],
              ),
              SimilarBlocConsumer(),
              ReviewRepo(),
            ]),
          )),
    );
  }

  BlocConsumer<MovieBloc, MovieState> SimilarBlocConsumer() {
    return BlocConsumer<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state is LoadingMovie) {
                  return LoadingState();
                }
                if (state is LoadedMovie) {
                  return SimilarMovieWidget(
                      title: "More Like This", movies: state.Similarmovies!);
                }
                if (state is FailureMovie) {
                  return Center(
                    child: Text(state.error.toString()),
                  );
                }
                return Container();
              },
              listener: (context, state) {},
            );
  }

  RepositoryProvider<ReviewsReposiotry> ReviewRepo() {
    return RepositoryProvider(
              create: (BuildContext context) => ReviewsReposiotry(),
              child: BlocProvider(
                create: (BuildContext context) => ReviewBloc(
                    RepositoryProvider.of<ReviewsReposiotry>(context))
                  ..add(RequestReviews(id: movie!.id.toString())),
                child: BlocConsumer<ReviewBloc, ReviewState>(
                  builder: (context, state) {
                    if (state is LoadingReviews) {
                      return LoadingState();
                    }
                    if (state is LoadedReview) {
                      return LoadedReviews(state);
                    }
                    if (state is FailureReview) {
                      return Center(
                        child: Text(state.error.toString()),
                      );
                    }
                    return Container();
                  },
                  listener: (context, state) {},
                ),
              ),
            );
  }

  Padding LoadedReviews(state) {
    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0, top: 10, bottom: 10),
                              child: Text(
                                "Reviews",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            state.reviews.isEmpty
                                ? Container(
                                    height: height! * 0.30,
                                    child: Center(
                                        child: Text(
                                      "No Reviews Yet",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  )
                                : Container(
                                    height: height! * 0.30,
                                    child: ListView.builder(
                                        itemCount: state.reviews.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return ReviewWidget(
                                              reviews: state.reviews[index]);
                                        })),
                          ],
                        ),
                      );
  }

  Center LoadingState() {
    return Center(
                    child: CircularProgressIndicator(),
                  );
  }

  Positioned BackArrowButton(BuildContext context) {
    return Positioned.fill(
                          child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      )
    );
  }

  Container MovieImage() {
    return Container(
      width: double.infinity,
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl:   "https://image.tmdb.org/t/p/w500/" + movie!.poster_path!,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),

      // decoration: BoxDecoration(
      //   color: Colors.transparent,
      //   image: DecorationImage(
      //     fit: BoxFit.fill,
      //     image: NetworkImage(
      //       "https://image.tmdb.org/t/p/w500/" + movie!.poster_path!,
      //     ),
      //   ),
      // ),
      height: 400,
    );
  }

  Container ContainerGradient() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.grey.withOpacity(0.0),
                Colors.black,
              ],
              stops: const [
                0.0,
                1.0
              ])),
    );
  }

  Row MovieInformation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          DateTime.parse(movie!.release_date!).toUtc().year.toString(),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const Text(
          "-",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          movie!.adult! == "false" ? "18+" : "13+",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }

  Text MovieTitle() {
    return Text(
      movie!.title!,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),
    );
  }

  Widget MovieOverview() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        movie!.overview!,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
