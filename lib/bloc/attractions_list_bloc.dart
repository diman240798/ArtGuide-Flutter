
import 'package:art_guide_flutter/model/attraction.dart';
import 'package:art_guide_flutter/model/attraction_type.dart';
import 'package:art_guide_flutter/repo/place_repo.dart';
import 'package:flutter/material.dart';

class AttractionListBloc with ChangeNotifier {
  List<Place> attractions;
  PlaceRepository repo;

  AttractionType currentType;

  AttractionListBloc() {
    repo = PlaceRepository(this);
    currentType = AttractionType.Museum;
    attractions = repo.getPlacesByType(AttractionType.Museum);
  }

  void setAttractionsByType(AttractionType type) {
    currentType = type;
    this.attractions = repo.getPlacesByType(type);
    notifyListeners();
  }

  void setAttractions(List<Place> attractions) {
    this.attractions = attractions;
    notifyListeners();
  }
}
