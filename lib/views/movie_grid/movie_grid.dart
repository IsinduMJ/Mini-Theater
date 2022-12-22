import 'package:flutter/material.dart';

import '../../models/movies.dart';
import '../../services/movie_api.dart';
import 'widgets/movie_tile.dart';

class MovieGrid extends StatelessWidget {
  MovieGrid({
    Key? key,
    required this.movieType,
  }) : super(key: key);

  dynamic movieType;
  MovieApi get movieData => MovieApi(movieType: movieType);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: FutureBuilder(
          future: movieData.getMovies(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Movies>> snapshot) {
            if (snapshot.hasData) {
              List<Movies>? moviesData = snapshot.data;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.75,
                ),
                itemCount: moviesData!.length,
                itemBuilder: (context, index) {
                  return MovieTile(
                    poster: moviesData[index].poster_path,
                    banner: moviesData[index].backdrop_path,
                    id: moviesData[index].id.toString(),
                    title: moviesData[index].title,
                    releasedDate: moviesData[index].release_date,
                    overview: moviesData[index].overview,
                    voteAverage: moviesData[index].vote_average.toString(),
                    popularity: moviesData[index].popularity.toString(),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
