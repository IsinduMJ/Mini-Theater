import 'dart:convert';
import 'package:http/http.dart';
import 'package:mini_theater/models/cast.dart';
import 'package:mini_theater/models/videos.dart';

class VideoApi {
  dynamic url, movieID, apiKey;
  VideoApi({
    this.url = 'https://api.themoviedb.org/3/movie/',
    this.apiKey = '/videos?api_key=79e1826269e1778d2c8f71432872d647',
    required this.movieID,
  });

  late String videoUrl = url + movieID + apiKey;

  Future<List<Video>> getVideos() async {
    Response response = await get(Uri.parse(videoUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> videoJson = jsonDecode(response.body);
      List<dynamic> body = videoJson['results'];
      List<Video> videoData =
          body.map((dynamic movie) => Video.fromJson(movie)).toList();

      return videoData;
    } else {
      throw ('Can\'t get data.');
    }
  }
}
