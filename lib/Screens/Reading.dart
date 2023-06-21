import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oet_learning_app/Resources/colors.dart';
import 'package:oet_learning_app/Resources/homecontainer.dart';
import 'package:oet_learning_app/Resources/responsive.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ReadingPage extends StatefulWidget {
  const ReadingPage({super.key});

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  late YoutubePlayerController _youtubePlayerController;
  late PlayerState _playerState;
  late YoutubeMetaData _youtubeMetaData;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  bool isPlayerReady = false;
  final String _videoUrl = "https://youtu.be/iFvyn8u-BT4";
  String _videoId = " ";

  Timer? timer;
  checkTime(){
    int totalTime =_youtubePlayerController.metadata.duration.inSeconds;
    if(_youtubePlayerController.value.position.inSeconds >= totalTime - 15){
      _youtubePlayerController.seekTo(const Duration(seconds: 0));
      _youtubePlayerController.pause();
    }
  }

  @override
  void initState(){
    super.initState();
    _videoId = YoutubePlayer.convertUrlToId(_videoUrl)!;
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: _videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: false,
        forceHD: true,
        isLive: false,
        enableCaption: false,
      )
    ) ..addListener((listener));
    _idController = TextEditingController();
    _youtubeMetaData= const YoutubeMetaData();
    _playerState = PlayerState.unknown;
    timer = Timer.periodic(const Duration(seconds: 5), (timer) => checkTime());
  }
  void listener() {
    if(isPlayerReady && mounted && !_youtubePlayerController.value.isFullScreen) {
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
    _youtubePlayerController.dispose();
    _idController.dispose();
    _seekToController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(_youtubePlayerController.value.metaData.duration.inSeconds);
    }
    double width = MediaQuery.of(context).size.width;
    if (kDebugMode) {
      print('\nTotal width = $width');
    }
    double remainingScreen = MediaQuery.of(context).size.height - MediaQuery.of(context).size.height / 3 ;
    if (kDebugMode) {
      print('\nRemaining width = $remainingScreen');
    }
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.zero,
            height: (MediaQuery.of(context).orientation == Orientation.landscape)
                          ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.height/3,
            width: (MediaQuery.of(context).orientation == Orientation.landscape)
                ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width,
            child: YoutubePlayer(
              width: width,
              controller: _youtubePlayerController,
              bottomActions: [
                CurrentPosition(),
                ProgressBar(
                  isExpanded: true,
                  colors: ProgressBarColors(
                    backgroundColor: secondaryColor,
                    playedColor: secondaryColor,
                    handleColor: Colors.white,
                    bufferedColor: tertiaryColor
                  ),
                ),
                const PlaybackSpeedButton(),
                FullScreenButton(),
                RemainingDuration(),
              ],
            ),
          ),
          (MediaQuery.of(context).orientation == Orientation.portrait) ?
            Container(
              color: secondaryColor,
            )
          : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
