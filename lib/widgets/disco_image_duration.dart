import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/audio_player_model.dart';
import 'package:provider/provider.dart';

class DiscoImageAndDuration extends StatelessWidget {
  const DiscoImageAndDuration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 80),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: const [
          DiscoImage(),
          Spacer(),
          DurationProgressBar(),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

class DiscoImage extends StatelessWidget {
  const DiscoImage({super.key});

  @override
  Widget build(BuildContext context) {
    final audioModel = Provider.of<AudioPlayerModel>(context);
    return Container(
      padding: const EdgeInsets.all(12),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff484750),
            Color(0xff1E1C24),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              animate: false,
              duration: const Duration(seconds: 10),
              infinite: true,
              manualTrigger: true,
              controller: (animationController) =>
                  audioModel.controller = animationController,
              child: const Image(image: AssetImage('assets/take_off_pic.jpg')),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(100)),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: const Color(0xff1C1C25),
                  borderRadius: BorderRadius.circular(100)),
            ),
          ],
        ),
      ),
    );
  }
}

class DurationProgressBar extends StatelessWidget {
  const DurationProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle estilo = TextStyle(color: Colors.white.withOpacity(0.5));
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    final porcentaje = audioPlayerModel.porcentaje;

    return Column(
      children: [
        Text(audioPlayerModel.songTotalDuration, style: estilo),
        const SizedBox(height: 10),
        Stack(
          children: [
            Container(
              width: 3,
              height: 250,
              color: Colors.white.withOpacity(0.2),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 3,
                height: 250 * porcentaje,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(audioPlayerModel.currentSecond, style: estilo),
      ],
    );
  }
}
