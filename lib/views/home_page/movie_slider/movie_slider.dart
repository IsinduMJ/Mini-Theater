import 'package:flutter/material.dart';
import 'package:mini_theater/services/movie_api.dart';

import '../../../models/movies.dart';
import 'slider_tile.dart';

class MovieSlider extends StatelessWidget {
  MovieSlider({required this.movieType, Key? key}) : super(key: key);

  String movieType;
  MovieApi get movieData => MovieApi(movieType: movieType);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.325,
      child: FutureBuilder(
        future: movieData.getMovies(),
        builder: (BuildContext context, AsyncSnapshot<List<Movies>> snapshot) {
          if (snapshot.hasData) {
            List<Movies>? movieData = snapshot.data;
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return SliderTile(
                  banner: movieData![index].backdrop_path,
                  poster: movieData[index].poster_path,
                  id: movieData[index].id.toString(),
                  title: movieData[index].title,
                  releasedDate: movieData[index].release_date,
                  overview: movieData[index].overview,
                  voteAverage: movieData[index].vote_average.toString(),
                  popularity: movieData[index].popularity.toString(),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 5);
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
