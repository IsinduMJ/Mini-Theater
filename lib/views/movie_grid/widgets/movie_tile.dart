import 'package:flutter/material.dart';

import '../../../components/body_text.dart';
import '../../../components/title_text.dart';
import '../../../utils/assets_constants.dart';
import '../../../utils/colors.dart';
import '../../movie_details/movie_details.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    required this.poster,
    required this.banner,
    required this.id,
    required this.title,
    required this.releasedDate,
    required this.overview,
    required this.voteAverage,
    required this.popularity,
    Key? key,
  }) : super(key: key);

  final dynamic poster,
      banner,
      title,
      id,
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
          MaterialPageRoute(builder: (context) {
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
          }),
        );
      },
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
                height: 100,
                width: size.width * 0.445,
                decoration: const BoxDecoration(
                  color: black,
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color.fromARGB(255, 0, 0, 0),
                      Color.fromARGB(135, 0, 0, 0),
                      Color.fromARGB(15, 0, 0, 0),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TitleText(
                    title: title,
                    fontSize: 17,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        BodyText(
                          text: voteAverage,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
