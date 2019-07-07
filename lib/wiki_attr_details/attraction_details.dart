import 'package:art_guide_flutter/components/app_bar.dart';
import 'package:art_guide_flutter/model/attraction.dart';
import 'package:art_guide_flutter/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';
import 'package:provider/provider.dart';

class WikiDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor:
          AppColors.colorGreenStatus, //or set color with: Color(0xFF0000FF)
    ));

    Place place = null;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: MyAppBar(),
            backgroundColor: Colors.transparent,
            floating: true,
          ),
          SliverGroupBuilder(
              decoration: ShapeDecoration(
                image: DecorationImage(
                    image: AssetImage('images/main_map_graphic.png'),
                    fit: BoxFit.fill),
                shape: Border.all(
                  color: Colors.grey,
                  style: BorderStyle.none,
                  width: 1,
                ),
              ),
              child: SliverList(
                  delegate:
                      SliverChildListDelegate(this.buildWidgets(context))))
        ],
      ),
    );
  }

  List<Widget> buildWidgets(BuildContext context) {
    var list = List<Widget>();

    var onWikiPressed = () {};
    var onListenClicked = () {};

    list.add(Column(
      children: <Widget>[
        Image.asset(
          'images/museum_rail_train_big.png',
          width: MediaQuery.of(context).size.width * 0.95,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Title",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              "DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION DESCROPTION",
              style: TextStyle(fontSize: 15)),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                  child: Image.asset('images/gif_speaking_hero.gif',
                      width: MediaQuery.of(context).size.width * 0.3)),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                      shape: StadiumBorder(),
                      onPressed: () => {onListenClicked},
                      color: AppColors.colorGreen,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 8.0),
                        child: Row(
                          // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(Icons.play_arrow,
                                  color: Colors.white, size: 20),
                            ),
                            Text("Послушать",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      )),
                  SizedBox(height: 20,),
                  FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.elliptical(30, 25),
                              topLeft: Radius.elliptical(30, 25))),
                      onPressed: () => {onWikiPressed},
                      color: AppColors.colorGreen,
                      child: Row(
                        // Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Icon(Icons.arrow_back, color: Colors.white, size: 20),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("WIKI",
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ))
                ],
              )
            ],
          ),
        )
      ],
    ));
    return list;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<PlaceProvider>(
        builder: (_) => PlaceProvider(),
        child: WikiDetailsPage(),
      ),
    );
  }
}

class PlaceProvider with ChangeNotifier {}

void main() {
  runApp(MyApp());
}
