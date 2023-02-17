import 'package:flutter/material.dart';
import 'package:music_player/widgets/widgets.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Background(),
              Column(
                children: const [
                  CustomAppBar(),
                  DiscoImageAndDuration(),
                  TitleAndPlay(),
                ],
              ),
            ],
          ),
          const LyricsWheel(),
        ],
      ),
    );
  }
}
