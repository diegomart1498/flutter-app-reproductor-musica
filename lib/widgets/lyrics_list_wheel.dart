import 'package:flutter/material.dart';
import 'package:music_player/helpers/helpers.dart';

class LyricsWheel extends StatelessWidget {
  const LyricsWheel({super.key});

  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();
    return Expanded(
      child: ListWheelScrollView(
        itemExtent: 42,
        diameterRatio: 1.5,
        physics: const BouncingScrollPhysics(),
        children: lyrics
            .map(
              (linea) => Text(
                linea,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
