import 'package:flutter/material.dart';

class AudioPlayerModel extends ChangeNotifier {
  late AnimationController controller;
  bool _playing = false;
  Duration _songDuration = const Duration(milliseconds: 0);
  Duration _currentTime = const Duration(milliseconds: 0);

  String get songTotalDuration => printDuration(_songDuration);
  String get currentSecond => printDuration(_currentTime);
  double get porcentaje => (_songDuration.inSeconds > 0)
      ? currentTime.inSeconds / _songDuration.inSeconds
      : 0;

  bool get playing => _playing;
  set playing(bool value) {
    _playing = value;
    notifyListeners();
  }

  Duration get songDuration => _songDuration;
  set songDuration(Duration value) {
    _songDuration = value;
    notifyListeners();
  }

  Duration get currentTime => _currentTime;
  set currentTime(Duration value) {
    _currentTime = value;
    notifyListeners();
  }

  // AnimationController get controller => _controller;
  // set controller(AnimationController valor) {
  //   _controller = valor;
  // }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}
