import 'package:flutter/material.dart';
import 'package:mini_theater/models/movies.dart';
import 'package:mini_theater/services/movie_api.dart';
import 'package:mini_theater/views/movie_grid/widgets/movie_tile.dart';

class SimilarMovies extends StatelessWidget {
  SimilarMovies({required this.movieID, super.key});

  String movieID;

  MovieApi get movieData => MovieApi(id: movieID);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: movieData.getSimilarMovie(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Movies>? movieData = snapshot.data;
          return SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: size.width * 0.375,
                  child: MovieTile(
                    poster: movieData![index].poster_path,
                    banner: movieData[index].backdrop_path,
                    id: movieData[index].id.toString(),
                    title: movieData[index].title,
                    releasedDate: movieData[index].release_date,
                    overview: movieData[index].overview,
                    voteAverage: movieData[index].vote_average.toString(),
                    popularity: movieData[index].popularity.toString(),
                  ),
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 13,
                );
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
