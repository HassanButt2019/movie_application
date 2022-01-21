import 'package:http/http.dart' as http;


class MovieDataProvider
{
  final String Api_Key = "";
  final String base_url = "https://api.themoviedb.org/3/movie/upcoming?api_key=c1e80fe769fd1c74e339f5e7349d0a56&language=en-US&page=1";


  Future<http.Response> getMovies()async
  {
    http.Response rawData = await http.get(Uri.parse(base_url));
  //  print(rawData.body);
    return rawData;
  }



}

/*
1)should be on handle presentation with states
2)calls the new apis
 */