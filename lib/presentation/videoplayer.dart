import 'package:flutter_application_1/presentation/custom/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  String video;
  String name;
  VideoPlayer({this.video, this.name});

  static const String routeNamed = 'VideoPlayer';
  @override
  _VideoPlayerState createState() => _VideoPlayerState(video, name);
}

class _VideoPlayerState extends State<VideoPlayer> {
  String video;
  String name;
  _VideoPlayerState(this.video, this.name);
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(video),
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: true,
        loop: false,
        enableCaption: false,
        hideThumbnail: true,
        controlsVisibleAtStart: true,
        forceHD: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbarOnTap: () {
        Navigator.pop(context);
      },
      appBarText: name,
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          aspectRatio: 16 / 9,
          showVideoProgressIndicator: true,
          bottomActions: <Widget>[
            SizedBox(width: 14.0),
            CurrentPosition(),
            SizedBox(width: 8.0),
            ProgressBar(
              isExpanded: true,
              colors: ProgressBarColors(
                  playedColor: Color(0xFFFF0000),
                  handleColor: Color(0xFFFF0000),
                  backgroundColor: Colors.grey,
                  bufferedColor: Colors.white),
            ),
            RemainingDuration(),
          ],
        ),
        builder: (context, player) {
          return Column(
            children: [player],
          );
        },
      ),
    );
  }
}
