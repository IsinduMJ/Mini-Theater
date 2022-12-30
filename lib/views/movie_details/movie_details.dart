import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mini_theater/components/title_text.dart';
import 'package:mini_theater/utils/colors.dart';
import 'package:mini_theater/views/movie_details/movie_cast.dart';
import 'package:mini_theater/views/movie_details/movie_overview.dart';
import 'package:mini_theater/views/movie_details/similar_movies.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../utils/assets_constants.dart';
import 'movie_videos.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({
    required this.banner,
    required this.poster,
    required this.id,
    required this.title,
    required this.releasedDate,
    required this.overview,
    required this.voteAverage,
    required this.popularity,
    super.key,
  });

  String banner,
      poster,
      id,
      title,
      releasedDate,
      overview,
      voteAverage,
      popularity;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: size.height * 0.325,
              width: size.width,
              color: white,
              child: Image.network(
                '${AssetsConstants.imagePath}$banner',
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * 0.675,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${AssetsConstants.imagePath}$poster'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Container(
                  height: size.height * 0.7,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: black.withOpacity(0.825),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: SlideInUp(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 25, right: 20),
                            child: TitleText(
                              title: title,
                              fontSize: 32,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: MovieOverview(
                              releasedDate: releasedDate,
                              overview: overview,
                              voteAverage: voteAverage,
                              popularity: popularity,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // const Padding(
                          //   padding: EdgeInsets.only(left: 20, bottom: 15),
                          //   child: TitleText(
                          //     title: 'Videos',
                          //     fontSize: 20,
                          //   ),
                          // ),
                          // Center(
                          //   child: VideoSlider(movieID: id),
                          // ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, top: 20),
                            child: TitleText(
                              title: 'Cast',
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          MovieCast(movieID: id),
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: TitleText(
                              title: 'Similar Movies',
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SimilarMovies(movieID: id),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 4, top: 7),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
