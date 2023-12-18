import 'package:flutter/material.dart';
import 'package:se_tube/apis/youtube_api.dart';
import 'package:se_tube/model/video_model.dart';
import 'package:se_tube/widgets/custom_youtube_player.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SE Tube'),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<VideoModel>>(
        future: YouTubeAPI.getVideos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          }

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            physics: BouncingScrollPhysics(),
            children: snapshot.data!
                .map((e) => CustomYouTubePlayer(videoModel: e))
                .toList(),
          );
        },
      ),
    );
  }
}
