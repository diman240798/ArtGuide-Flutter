import 'package:art_guide_flutter/bloc/shared/map_state_bloc.dart';
import 'package:art_guide_flutter/bloc/shared/wiki_details_current_bloc.dart';
import 'package:art_guide_flutter/model/attraction.dart';
import 'package:art_guide_flutter/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PathInfoBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Place currentPlace =
        Provider.of<WikiDetailsSharedBloc>(context).currentAttraction;
    MapState mapState = Provider.of<MapStateBloc>(context).currentMapState;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String time = '30мин';
    String meters = '600м';

    var routeInfo = buildRouteInfo(screenWidth, currentPlace, meters, time);
    var loadingRoute = buildLoadingProgress(screenWidth, currentPlace);

    return Container(
      width: screenWidth,
      height: 50,
      child: Row(
        children: <Widget>[
          Image.asset(currentPlace.imageSmall,
              width: screenWidth * 0.2,
              height: screenHeight * 0.2,
              fit: BoxFit.fill),
          mapState == MapState.GETTING_FITST_ROUTE ? loadingRoute : routeInfo,
          Container(
            width: screenWidth * 0.1,
            child: IconButton(
                padding: EdgeInsets.all(2),
                onPressed: () {},
                icon: Image.asset('images/close_sign.png')),
          )
        ],
      ),
    );
  }

  Container buildLoadingProgress(double screenWidth, Place currentPlace) {
    return Container(
        width: screenWidth * 0.7,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(currentPlace.title,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(AppColors.colorGreen),
                  ),
                  height: 20.0,
                  width: 20.0,
                ),
              )
            ],
          ),
        ));
  }

  Container buildRouteInfo(
      double screenWidth, Place currentPlace, String meters, String time) {
    return Container(
      width: screenWidth * 0.7,
      child: Column(children: <Widget>[
        Text(currentPlace.title, style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 8.0, right: 30),
              child: Text(meters),
            ),
            Image.asset('images/man_walk.png'),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 8.0),
              child: Text(time),
            )
          ],
        )
      ]),
    );
  }
}
