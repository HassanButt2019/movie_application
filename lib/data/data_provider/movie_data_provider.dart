import 'package:http/http.dart' as http;


class MovieDataProvider
{

  final  _Ucomingurl = "https://api.themoviedb.org/3/movie/upcoming?api_key=c1e80fe769fd1c74e339f5e7349d0a56&language=en-US&page=";
  final _top_rated = "https://api.themoviedb.org/3/movie/top_rated?api_key=c1e80fe769fd1c74e339f5e7349d0a56&language=en-US&page=";
  final _popular = "https://api.themoviedb.org/3/movie/popular?api_key=c1e80fe769fd1c74e339f5e7349d0a56&language=en-US&page=1";
  final _latest = "https://api.themoviedb.org/3/movie/latest?api_key=c1e80fe769fd1c74e339f5e7349d0a56&language=en-US";

  Future<http.Response> getUpcomingMovies(int pageNumber)async
  {
    http.Response rawData = await http.get(Uri.parse(_Ucomingurl+pageNumber.toString()));
    return rawData;
  }

  Future<http.Response> getTopRatedMovies(int pageNumber)async
  {
    http.Response rawData = await http.get(Uri.parse(_top_rated+pageNumber.toString()));
    return rawData;
  }

  Future<http.Response> getPopularMovies(int pageNumber)async
  {
    http.Response rawData = await http.get(Uri.parse(_popular+pageNumber.toString()));
    return rawData;
  }

  Future<http.Response> getLatestMovies()async
  {
    http.Response rawData = await http.get(Uri.parse(_latest));
    return rawData;
  }

  Future<http.Response> getSimilarMovies(String id)async
  {
    http.Response rawData = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$id/similar?api_key=c1e80fe769fd1c74e339f5e7349d0a56&language=en-US&page=1"));
    return rawData;
  }


}

/*
1)should be on handle presentation with states
2)calls the new apis
 */


//pagination