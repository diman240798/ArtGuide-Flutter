import 'package:art_guide_flutter/model/attraction.dart';
import 'package:art_guide_flutter/model/attraction_type.dart';
import 'package:flutter/material.dart';

class WikiDetailsSharedBloc with ChangeNotifier {
  Place currentAttraction = Place(0, 'Музей железнодорожной техники', 47.190518, 39.637158, 'images/museum_rail_train_small.jpg', 'images/museum_rail_train_big.jpg', 'Филиал Музея истории Северо-Кавказской железной дороги открылся в 2003 году на западной окраине Ростова, ', AttractionType.Museum);

  void setCurrentAttraction(Place currentAttraction) {
    this.currentAttraction = currentAttraction;
    notifyListeners();
  }
}
