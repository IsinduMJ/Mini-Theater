import 'package:flutter/material.dart';
import 'package:mini_theater/services/movie_api.dart';
import '../../../models/movies.dart';
import 'header_tile.dart';

class HeaderSlider extends StatelessWidget {
  HeaderSlider({
    Key? key,
  }) : super(key: key);

  MovieApi movieData = MovieApi(movieType: 'now_playing');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: FutureBuilder(
        future: movieData.getMovies(),
        builder: (BuildContext context, AsyncSnapshot<List<Movies>> snapshot) {
          if (snapshot.hasData) {
            List<Movies>? moviesData = snapshot.data;
            return PageView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return HeaderTile(
                  poster: moviesData![index].poster_path,
                  banner: moviesData[index].backdrop_path,
                  id: moviesData[index].id.toString(),
                  title: moviesData[index].title,
                  releasedDate: moviesData[index].release_date,
                  overview: moviesData[index].overview,
                  voteAverage: moviesData[index].vote_average.toString(),
                  popularity: moviesData[index].popularity.toString(),
                  index: index,
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
