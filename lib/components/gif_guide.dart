
import 'package:flutter/material.dart';
import 'package:gif_ani/gif_ani.dart';

class GifGuide extends StatefulWidget {
  GifGuideState state;

  @override
  State<StatefulWidget> createState() {
    state = GifGuideState();
    return state;
  }
}

class GifGuideState extends State<GifGuide>
    with SingleTickerProviderStateMixin {

  GifController animationCtrl;

  @override
  void initState() {
    super.initState();
    animationCtrl = new GifController(
        vsync: this,
        duration: Duration(milliseconds: 1500),
        frameCount: 64);
  }

  @override
  Widget build(BuildContext context) {
    return GifAnimation(
      gaplessPlayback: true,
      width: MediaQuery
          .of(context)
          .size
          .width * 0.5,
      image: new AssetImage('images/gif_speaking_hero.gif'),
      controller: animationCtrl,
    );
  }
}
