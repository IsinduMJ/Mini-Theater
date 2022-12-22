import 'package:flutter/material.dart';
import 'package:mini_theater/services/movie_api.dart';

import '../../components/title_text.dart';
import '../../models/movies.dart';
import '../../utils/colors.dart';
import '../movie_grid/widgets/movie_tile.dart';
import '../navigation_drawer/navigation_drawer.dart';

class SearchResults extends StatelessWidget {
  SearchResults({
    required this.query,
    super.key,
  });

  String query;
  MovieApi get movieData => MovieApi(query: query);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleText(
          title: 'Search',
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: FutureBuilder(
            future: movieData.getSearchMovie(),
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
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return MovieTile(
                      poster: moviesData![index].poster_path,
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
      ),
      drawer: const NavigationDrawer(),
    );
  }
}
