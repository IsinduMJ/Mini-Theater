import 'dart:convert';
import 'package:http/http.dart';
import 'package:mini_theater/models/cast.dart';

class CastApi {
  dynamic url, movieID, apiKey;
  CastApi({
    this.url = 'https://api.themoviedb.org/3/movie/',
    this.apiKey = '?api_key=79e1826269e1778d2c8f71432872d647',
    required this.movieID,
  });

  late String movieCastUrl = url + movieID + '/credits' + apiKey;

  Future<List<Cast>> getCast() async {
    Response response = await get(Uri.parse(movieCastUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> castDataJson = jsonDecode(response.body);
      List<dynamic> body = castDataJson['cast'];
      List<Cast> castData =
          body.map((dynamic movie) => Cast.fromJson(movie)).toList();

      return castData;
    } else {
      throw ('Can\'t get data.');
    }
  }
}
