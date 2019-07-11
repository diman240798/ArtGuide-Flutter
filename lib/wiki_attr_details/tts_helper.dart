import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsHelper {
  FlutterTts tts = FlutterTts();

  TtsHelper(VoidCallback onCompleteCallback) {
    tts.setCompletionHandler(onCompleteCallback);
  }

  void start(String text) {
    tts.speak(text);
  }

  void stop() {
    tts.stop();
  }
}