import 'package:flutter/material.dart';
import 'package:mini_theater/views/movie_details/movie_details.dart';

import '../../../components/body_text.dart';
import '../../../components/title_text.dart';
import '../../../utils/assets_constants.dart';
import '../../../utils/colors.dart';

class SliderTile extends StatelessWidget {
  SliderTile(
      {required this.banner,
      required this.poster,
      required this.id,
      required this.title,
      required this.releasedDate,
      required this.overview,
      required this.voteAverage,
      required this.popularity,
      Key? key})
      : super(key: key);

  String poster,
      banner,
      id,
      title,
      releasedDate,
      overview,
      voteAverage,
      popularity;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MovieDetails(
                banner: banner,
                poster: poster,
                id: id,
                title: title,
                releasedDate: releasedDate,
                overview: overview,
                voteAverage: voteAverage,
                popularity: popularity,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2.5),
        child: Container(
          width: size.width * 0.445,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(
                '${AssetsConstants.imagePath}$poster',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 90,
                  width: size.width * 0.445,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        black,
                        black.withOpacity(0.1),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 5, right: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TitleText(
                        title: title,
                        fontSize: 20,
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 17,
                            color: Colors.amber,
                          ),
                          BodyText(text: voteAverage, fontSize: 13)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
