import 'package:se_tube/constants/constant_url.dart';
import 'package:dio/dio.dart';
import 'package:se_tube/model/video_model.dart';

class YouTubeAPI {
  static Future<List<VideoModel>> getVideos() async {
    final response = await Dio().get(
      YOUTUBE_BASE_URL,
      queryParameters: {
        'channelId': CF_CHANNEL_ID,
        'maxResults': 50,
        'key': API_KEY,
        'part': 'snippets',
        'order': 'date',
      },
    );
  }
}
