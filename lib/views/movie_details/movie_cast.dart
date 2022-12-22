import 'package:flutter/material.dart';
import 'package:mini_theater/components/title_text.dart';
import 'package:mini_theater/models/cast.dart';
import 'package:mini_theater/services/cast_api.dart';
import 'package:mini_theater/utils/colors.dart';

import '../../components/body_text.dart';
import '../../utils/assets_constants.dart';

class MovieCast extends StatelessWidget {
  MovieCast({required this.movieID, super.key});

  String movieID;

  CastApi get castData => CastApi(movieID: movieID);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: castData.getCast(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Cast>? castData = snapshot.data;
          return SizedBox(
            height: 145,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 100,
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                              '${AssetsConstants.imagePath}${castData![index].profile_path}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      TitleText(
                        title: castData[index].name,
                        fontSize: 14.5,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 2,
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
