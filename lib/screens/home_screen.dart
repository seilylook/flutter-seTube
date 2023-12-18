import 'package:flutter/material.dart';
import 'package:se_tube/model/video_model.dart';
import 'package:se_tube/widgets/custom_youtube_player.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomYouTubePlayer(
        videoModel: VideoModel(
          id: '3Ck42C2ZCb8',
          title: '다트 언어 기본기 1시간안에 끝내기.',
        ),
      ),
    );
  }
}
