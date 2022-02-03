// import 'package:bloc/bloc.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:movieapp/bloc/movie_bloc/events/get_movie.dart';
// import 'package:movieapp/bloc/movie_bloc/movie_bloc.dart';
// import 'package:movieapp/bloc/movie_bloc/states/movie_failure.dart';
// import 'package:movieapp/bloc/movie_bloc/states/movie_initial.dart';
// import 'package:movieapp/bloc/movie_bloc/states/movie_loaded.dart';
// import 'package:movieapp/bloc/movie_bloc/states/movie_loading.dart';
// import 'package:movieapp/data/fakeRepos/fakeMovieRepo.dart';
// import 'package:movieapp/data/models/movie.dart';
// import 'package:movieapp/data/repository/movie_repository.dart';
//
// void main() {
//   FakeMovieReposiotry movieReposiotry  = FakeMovieReposiotry();
//
//
//   group('GetMovies', () {
//     test(
//       'Get upcomming movies',
//           () {
//         when( movieReposiotry.getPopularMovies())
//         .thenAnswer((_) async => [Movie(id: "12") , Movie(id: "23")]);
//
//         final bloc = MovieBloc(movieReposiotry);
//         bloc.add(RequestMovie());
//         expectLater(
//           bloc,
//           emitsInOrder([
//             InitialMovie(),
//             LoadingMovie(),
//             LoadedMovie(Upcomingmovies:[Movie(id: "12") , Movie(id: "23")] , TopRatedmovies: [Movie(id: "12") , Movie(id: "23")] , Popularmovies: [Movie(id: "12") , Movie(id: "23")]  ),
//             FailureMovie(error: "Not Loaded")
//           ]),
//         );
//       },
//     );
//   });
// }

// xpectLater(bloc, [

//1) unit testing (follow weather app tutorial from bloc library)
//2) follow and study dart conventions
//3) form valid
