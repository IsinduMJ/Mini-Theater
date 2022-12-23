import 'package:flutter/cupertino.dart';

class Video {
  dynamic videoID;

  Video({
    required this.videoID,
  });

  factory Video.fromJson(Map<String, dynamic> videoJson) {
    return Video(videoID: videoJson['key']);
  }
}
