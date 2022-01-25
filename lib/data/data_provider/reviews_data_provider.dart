


import 'package:http/http.dart' as http;


class ReviewsDataProvider
{
  Future<http.Response> getMoviesReviews(String id)async
  {
    http.Response rawData = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$id/reviews?api_key=c1e80fe769fd1c74e339f5e7349d0a56&language=en-US&page=1"));
    return rawData;
  }


}

/*
1)should be on handle presentation with states
2)calls the new apis
 */