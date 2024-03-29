import 'dart:async';

import 'package:flutter/material.dart';
import 'package:art_guide_flutter/main/main.dart';

void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => MainPage()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 120),
                child: Column(
                  children: <Widget>[
                    Image.asset('images/main_sign_image.png'),
                    Text(
                      "Культурный гид",
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
            )
          ],
        )
    );
  }
}

/*,*/