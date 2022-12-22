import 'package:flutter/material.dart';

import '../../../components/body_text.dart';
import '../../../components/title_text.dart';
import '../../../utils/assets_constants.dart';
import '../../../utils/colors.dart';
import '../../movie_details/movie_details.dart';

class HeaderTile extends StatelessWidget {
  HeaderTile({
    Key? key,
    required this.poster,
    required this.banner,
    required this.id,
    required this.title,
    required this.releasedDate,
    required this.overview,
    required this.voteAverage,
    required this.popularity,
    required this.index,
  }) : super(key: key);

  String poster,
      banner,
      id,
      title,
      releasedDate,
      overview,
      voteAverage,
      popularity;
  final int index;

  @override
  Widget build(BuildContext context) {
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
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              '${AssetsConstants.imagePath}$poster',
            ),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 175,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      black.withOpacity(1),
                      black.withOpacity(0.65),
                      black.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 30),
                child: TitleText(
                  title: title,
                  fontSize: 28,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 15),
                child: Row(
                  children: List.generate(10, (indexDots) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.5),
                      child: Container(
                        height: 7,
                        width: index == indexDots ? 13 : 7,
                        decoration: BoxDecoration(
                          color: index == indexDots
                              ? white
                              : white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(3.5),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.play_circle, size: 18, color: Colors.amber),
                    SizedBox(width: 5),
                    BodyText(text: 'Now playing', fontSize: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
