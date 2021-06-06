import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../constants.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({Key key}) : super(key: key);

  static void show(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GuidePage(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'ffGGA5fuW0w', // id youtube video
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buidAppBar(context, "Guide d'utilisation"),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Comment utiliser l'application ?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black54),
                ),
                SizedBox(height: 25.0,),
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,

                ),
              ],
            ),
          ),
        ),
      ),

    );
  }

  // _buildContent(BuildContext context) {
  //   return
  // }

  Widget buidAppBar(BuildContext context, String title) {
    return AppBar(
      title: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 22)),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: <Widget>[SizedBox(width: kDefaultPaddin / 2)],
    );
  }
}
