import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wild_sport/home_pages/videoPlayer.dart';
import 'package:wild_sport/models/highlightsModel.dart';

class VideoMediaPlayer extends StatefulWidget {
  final Highlight highlight;

  VideoMediaPlayer({required this.highlight});
  @override
  _VideoMediaPlayerState createState() => _VideoMediaPlayerState();
}

class _VideoMediaPlayerState extends State<VideoMediaPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: VideoPlayerWidget(
        url: "",
      ),
    );
  }
}
