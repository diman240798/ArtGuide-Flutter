import 'package:art_guide_flutter/bloc/shared/map_state_bloc.dart';
import 'package:art_guide_flutter/bloc/shared/wiki_details_current_bloc.dart';
import 'package:art_guide_flutter/map/map.dart';
import 'package:art_guide_flutter/no_connection/no_connection.dart';
import 'package:art_guide_flutter/ui/colors.dart';
import 'package:art_guide_flutter/wiki_attr_details/attraction_details.dart';
import 'package:art_guide_flutter/wiki_attr_list/attractionsWiki.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import 'app_router.dart';

void main() => runApp(MaterialApp(home: MainPage()));


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<WikiDetailsSharedBloc>(
          builder: (_) => WikiDetailsSharedBloc(),
      ),
      ChangeNotifierProvider<MapStateBloc>(
        builder: (_) => MapStateBloc(),
      )
    ],
        child: MaterialApp(
          home: MainScreen(),
          routes: <String, WidgetBuilder> {
            AppRouter.MAIN_PAGE: (ctx) => this,
            AppRouter.MAP_PAGE: (ctx) => MapPage(),
            AppRouter.WIKI_LIST_PAGE: (ctx) => WikiListPage(),
            AppRouter.WIKI_DETAILS_PAGE: (ctx) => WikiDetailsPage(),
            AppRouter.NO_CONNECTION_PAGE: (ctx) => NoConnectionPage(),
          },
        )
    );
  }
}

class MainScreen extends StatelessWidget {

  var location = new Location();

  @override
  Widget build(BuildContext ctx) {
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
                  Image.asset('images/main_sign_image.png',
                      alignment: Alignment.center),
                  Text(
                    "Культурный гид",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 80.0),
                    child: FlatButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      color: AppColors.colorGreen,
                      shape: StadiumBorder(),
                      onPressed: () => onMapClicked(ctx),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Начать экскурсию",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  )
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
                    onPressed: () => onWikiClicked(ctx)
                ),
              ),
            )),
      ]),
    );
  }

  Future onMapClicked(BuildContext ctx) async {
    try {
      var currentLocation = await location.getLocation();
      print(currentLocation.latitude.toString() + " " +currentLocation.longitude.toString());
      Navigator.of(ctx).pushNamed(AppRouter.MAP_PAGE);
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {

      }
    }
  }

  void onWikiClicked(BuildContext context) => Navigator.pushNamed(context, AppRouter.WIKI_LIST_PAGE);
}