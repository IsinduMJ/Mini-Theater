import 'dart:convert';

import 'package:http/http.dart';
import 'package:mini_theater/models/movies.dart';

class MovieApi {
  dynamic url, apiKey, movieType, id, query;
  MovieApi({
    this.url = 'https://api.themoviedb.org/3/',
    this.apiKey = '?api_key=79e1826269e1778d2c8f71432872d647',
    this.movieType = 'popular',
    this.id = '0',
    this.query = '',
  });

  late String movieDataUrl = url + 'movie/' + movieType + apiKey;

  Future<List<Movies>> getMovies() async {
    Response response = await get(Uri.parse(movieDataUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> movieDataJson = jsonDecode(response.body);
      List<dynamic> body = movieDataJson['results'];
      List<Movies> movieData =
          body.map((dynamic movie) => Movies.fromJson(movie)).toList();

      return movieData;
    } else {
      throw ('Can\'t get data.');
    }
  }

  late String movieSearchUrl =
      url + 'search/movie' + apiKey + '&query=' + query;

  Future<List<Movies>> getSearchMovie() async {
    Response response = await get(Uri.parse(movieSearchUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> movieDataJson = jsonDecode(response.body);
      List<dynamic> body = movieDataJson['results'];
      List<Movies> movieData =
          body.map((dynamic movie) => Movies.fromJson(movie)).toList();

      return movieData;
    } else {
      throw ('Can\'t get data.');
    }
  }

  late String similarMoviesUrl = url + 'movie/' + id + '/similar' + apiKey;

  Future<List<Movies>> getSimilarMovie() async {
    Response response = await get(Uri.parse(similarMoviesUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> movieDataJson = jsonDecode(response.body);
      List<dynamic> body = movieDataJson['results'];
      List<Movies> movieData =
          body.map((dynamic movie) => Movies.fromJson(movie)).toList();

      return movieData;
    } else {
      throw ('Can\'t get data.');
    }
  }
}
