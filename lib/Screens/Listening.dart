import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class ListeningPage extends StatefulWidget {
  const ListeningPage({super.key});
  @override
  State<ListeningPage> createState() => _ListeningPageState();
}

class _ListeningPageState extends State<ListeningPage> {
  late YoutubePlayerController _youtubePlayerController;
  late PlayerState _playerState;
  late YoutubeMetaData _youtubeMetaData;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late bool isPlayerReady ;
  final String videoUrl = "https://youtu.be/iFvyn8u-BT4";
  late String videoId;

  @override
  void initState(){
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(videoUrl)!;
    _youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: false,
        forceHD: true,
        isLive: false,
        enableCaption: false,
      )
    ) ..addListener((listener));
  }
  void listener(){
    if(isPlayerReady && mounted && !_youtubePlayerController.value.isFullScreen){
      setState(() {
        _playerState = _youtubePlayerController.value.playerState;
        _youtubeMetaData = _youtubePlayerController.metadata;
      });
    }
  }
  @override
  void deactivate() {
    _youtubePlayerController.pause();
    super.deactivate();
  }
  @override
  void dispose(){
    super.dispose();
    _youtubePlayerController.dispose();
    _idController.dispose();
    _seekToController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}


