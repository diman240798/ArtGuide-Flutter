import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:art_guide_flutter/ui/colors.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: AppColors.colorGreenStatus, //or set color with: Color(0xFF0000FF)
    ));

    return new Scaffold(
      body: new Stack(children: <Widget>[
        new Image.asset(
          'images/main_map_graphic.png',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
        Container(
            margin: EdgeInsets.only(top: 120),
            child: new Align(
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
        new Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 30,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/main_wiki_button.png'),
              ),
            ),
            child: new FlatButton(
                padding: EdgeInsets.all(0.0), onPressed: () => {}, child: null),
          ),
        ),
      ]),
    );
  }
}
