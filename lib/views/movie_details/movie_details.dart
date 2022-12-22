import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mini_theater/components/title_text.dart';
import 'package:mini_theater/utils/colors.dart';
import 'package:mini_theater/views/movie_details/movie_cast.dart';
import 'package:mini_theater/views/movie_details/movie_overview.dart';
import 'package:mini_theater/views/movie_details/similar_movies.dart';

import '../../utils/assets_constants.dart';

class MovieDetails extends StatefulWidget {
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
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
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
                '${AssetsConstants.imagePath}${widget.banner}',
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
                    image: NetworkImage(
                        '${AssetsConstants.imagePath}${widget.poster}'),
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
                              title: widget.title,
                              fontSize: 32,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: MovieOverview(
                              releasedDate: widget.releasedDate,
                              overview: widget.overview,
                              voteAverage: widget.voteAverage,
                              popularity: widget.popularity,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: TitleText(
                              title: 'Cast',
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          MovieCast(movieID: widget.id),
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
                          SimilarMovies(movieID: widget.id),
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
