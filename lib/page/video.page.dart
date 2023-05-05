import 'package:flutter/material.dart';
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';

class VideoPage extends StatefulWidget {
  final String url;
  const VideoPage(this.url,{Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: YoYoPlayer(url: widget.url),);
  }
}
