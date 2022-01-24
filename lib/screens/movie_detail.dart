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
        backgroundColor: Colors.transparent,
          appBar: AppBar(
            flexibleSpace: const AppBarGradient(),
            title: Text(movie!.title!.toUpperCase()),
          ),
          body: BlocProvider(
            create: (BuildContext context) =>
                MovieBloc(RepositoryProvider.of<MovieReposiotry>(context))
                  ..add(GetSimilarMovies(id: movie!.id.toString())),
            child: ListView(
              children:[
                Column(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w500/" +
                                            movie!.poster_path!),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Column(
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
                              style: const TextStyle(
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
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        ),
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
                                children: const [
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
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        movie!.overview!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                BlocConsumer<MovieBloc, MovieState>(
                  builder: (context, state) {
                    if (state is LoadingMovie) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is LoadedMovie) {
                      return SimilarMovieWidget(
                          title: "More Like This",
                          movies: state.Similarmovies!);
                    }

                    if (state is FailureMovie) {
                      return Center(
                        child: Text(state.error.toString()),
                      );
                    }

                    return Container();
                  },
                  listener: (context, state) {
                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                   height: height!*0.30,
                    child: ListView.builder(
                      itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context , index){
                          return ReviewWidget();
                        })
                  ),
                ),

            ]
            ),
          )),
    );
  }
}
