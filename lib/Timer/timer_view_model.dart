import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class TimerViewModel extends ChangeNotifier {
  late int setCount = 300;
  late int count = 300;
  late Timer _timer;

  /// work finish:0
  /// rest finish:1
  late int mode = 0;

  final AudioCache _cache = AudioCache(
    fixedPlayer: AudioPlayer(),
  );

  static const FINISH_SOUND = 'girls_voice.mp3';
  static const REST_FINISH_SOUND = 'girls_voice_fight.mp3';

  void start() {
    print(count.toString());
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      print(count.toString());
      countDownStart();
    });
    _timer.isActive;
  }

  void stop() {
    _timer.cancel();
  }

  void countDownStart() {
    count--;
    if (count <= 0) {
      stop();
      switch (mode) {
        case 0:
          _cache.loadAll([FINISH_SOUND]);
          _cache.play(FINISH_SOUND);
          break;
        case 1:
          _cache.loadAll([REST_FINISH_SOUND]);
          _cache.play(REST_FINISH_SOUND);
          break;
      }
    }
    notifyListeners();
  }

  void countStop() {}

  void reset() {
    count = setCount;
    _timer.cancel();
    notifyListeners();
  }

  void setTime(int t, int m) {
    mode = m;
    setCount = t;
    count = setCount;
    notifyListeners();
  }

  String calcCount() {
    int minute = count ~/ 60;
    int seconds = count % 60;
    return addZero(minute) + ":" + addZero(seconds);
  }

  String addZero(int n) {
    return n < 10 ? "0" + n.toString() : n.toString();
  }

  Color setColor() {
    return Colors.blue;
  }

  double setHeight(double height) {
    var h = height * ((count - 1) / (setCount - 1));
    return h < 0 ? 0 : h;
  }
}
