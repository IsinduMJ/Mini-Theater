import 'package:flutter/material.dart';

import '../../components/body_text.dart';
import '../../utils/colors.dart';

class MovieOverview extends StatelessWidget {
  MovieOverview({
    Key? key,
    required this.releasedDate,
    required this.overview,
    required this.voteAverage,
    required this.popularity,
  }) : super(key: key);

  String releasedDate, overview, voteAverage, popularity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const BodyText(
              text: 'Released date : ',
              fontSize: 14,
            ),
            BodyText(
              text: releasedDate,
              fontSize: 14,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const BodyText(
          text: 'Overview',
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(
          height: 5,
        ),
        BodyText(
          text: overview,
          fontSize: 15,
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BodyText(
                  text: 'Rating',
                  fontSize: 14,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 45,
                ),
                BodyText(
                  text: '$voteAverage / 10',
                  fontSize: 20,
                ),
              ],
            ),
            Container(
              height: 75,
              width: 1,
              color: white,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BodyText(
                  text: 'Popularity',
                  fontSize: 14,
                ),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 45,
                ),
                BodyText(
                  text: popularity,
                  fontSize: 20,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
