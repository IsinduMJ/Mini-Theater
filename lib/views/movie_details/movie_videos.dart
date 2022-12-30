import 'package:flutter/material.dart';
import 'package:mini_theater/components/title_text.dart';
import 'package:mini_theater/services/video_api.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../models/videos.dart';
import '../../utils/colors.dart';

class VideoSlider extends StatelessWidget {
  const VideoSlider({required this.movieID, super.key});
  final String movieID;

  VideoApi get videoData => VideoApi(movieID: movieID);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: videoData.getVideos(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Video>? videoData = snapshot.data;
          return SizedBox(
            height: 300,
            width: size.width * 0.915,
            child: PageView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return VideoViewer(
                  videoID: videoData![index].videoID,
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

class VideoViewer extends StatelessWidget {
  const VideoViewer({Key? key, required this.videoID}) : super(key: key);

  final String videoID;

  YoutubePlayerController get _controller => YoutubePlayerController(
        initialVideoId: videoID,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: white,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
          onReady: () {
            _controller.addListener(() {});
          },
        ),
        const TitleText(
          title: 'Video',
          fontSize: 20,
        ),
      ],
    );
  }
}
