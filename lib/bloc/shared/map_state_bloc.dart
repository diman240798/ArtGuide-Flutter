import 'package:flutter/material.dart';

class MapStateBloc with ChangeNotifier {
  MapState currentMapState = MapState.SEARCIHNG;

  void setMapState(MapState mapState) {
    this.currentMapState = mapState;
    notifyListeners();
  }
}

enum MapState { SEARCIHNG, SHOWING_PLACE_INFO, GETTING_FITST_ROUTE, NAVIGATING }
