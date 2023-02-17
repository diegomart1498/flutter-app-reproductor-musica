import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:music_player/models/audio_player_model.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class TitleAndPlay extends StatefulWidget {
  const TitleAndPlay({super.key});

  @override
  State<TitleAndPlay> createState() => _TitleAndPlayState();
}

class _TitleAndPlayState extends State<TitleAndPlay>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  late AnimationController playAnimation;

  bool firstTime = true;
  final assetAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    playAnimation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    super.initState();
  }

  @override
  void dispose() {
    playAnimation.dispose();
    super.dispose();
  }

  void open() {
    final audioPlayerModel =
        Provider.of<AudioPlayerModel>(context, listen: false);

    assetAudioPlayer.open(
      Audio('assets/Take_Off_Baby.mp3'),
      autoStart: true,
      showNotification: true,
    );

    assetAudioPlayer.currentPosition.listen((duration) {
      audioPlayerModel.currentTime = duration;
    });

    assetAudioPlayer.current.listen((playingAudio) {
      audioPlayerModel.songDuration =
          playingAudio?.audio.duration ?? const Duration(seconds: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Take Off, Baby!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Ronald Christoph',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const Spacer(),
          FloatingActionButton(
            backgroundColor: const Color(0xffF8CB51),
            onPressed: () {
              final audioModel =
                  Provider.of<AudioPlayerModel>(context, listen: false);
              if (isPlaying) {
                playAnimation.reverse();
                isPlaying = false;
                audioModel.controller.stop();
              } else {
                playAnimation.forward();
                isPlaying = true;
                audioModel.controller.repeat();
              }
              if (firstTime) {
                open();
                firstTime = false;
              } else {
                assetAudioPlayer.playOrPause();
              }
            },
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: playAnimation,
            ),
          ),
        ],
      ),
    );
  }
}
