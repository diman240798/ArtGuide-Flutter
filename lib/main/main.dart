import 'package:art_guide_flutter/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor:
          AppColors.colorGreenStatus, //or set color with: Color(0xFF0000FF)
    ));

    return new Scaffold(
      body: new Stack(children: <Widget>[
        Image.asset(
          'images/main_map_graphic.png',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
        Container(
            margin: EdgeInsets.only(top: 120),
            child: Align(
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new Image.asset('images/main_sign_image.png',
                      alignment: Alignment.center),
                  new Text(
                    "Культурный гид",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
        Positioned(
            child: Align(
          alignment: FractionalOffset.bottomCenter,
          child: SizedBox(
            width: 120,
            height: 50,
            child: IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                padding: EdgeInsets.only(top: 20.0),
                iconSize: 20,
                icon: Image.asset('images/main_wiki_button.png'),
                onPressed: () {}),
          ),
        )),
      ]),
    );
  }
}
