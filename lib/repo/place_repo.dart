import 'package:art_guide_flutter/csv/csv_reader.dart';
import 'package:art_guide_flutter/model/attraction.dart';
import 'package:art_guide_flutter/model/attraction_type.dart';
import 'package:art_guide_flutter/wiki_attr_list/attractionsWiki.dart';

class PlaceRepository {
  List<Place> places;
  PlaceRepository(AttractionListBloc bloc) {
    places = CsvReader.getData(bloc, this);
  }

  List<Place> getPlacesByType(AttractionType type) {
    return places.where((place) => place.type == type).toList(growable: false);
  }
}