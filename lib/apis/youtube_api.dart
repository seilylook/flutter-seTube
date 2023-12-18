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
        'part': 'snippet',
        'order': 'date',
      },
    );

    final listWithData = response.data['items'].where(
      (item) =>
          item?['id']?['videoId'] != null && item?['snippet']?['title'] != null,
    );

    return listWithData
        .map<VideoModel>(
          (item) => VideoModel(
            id: item['id']['videoId'],
            title: item['snippet']['title'],
          ),
        )
        .toList();
  }
}
