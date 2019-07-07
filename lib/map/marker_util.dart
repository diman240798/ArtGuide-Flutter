import 'package:art_guide_flutter/model/attraction_type.dart';

class MarkerUtil {
  static String getMarkerIconPathById(int id) {
    AttractionType type = getTypeById(id);

    if (type == AttractionType.Museum) {
      return 'images/map_marker_museam.png';
    } else if (type == AttractionType.Theatre) {
      return 'images/map_marker_theatre.png';
    } else if (type == AttractionType.Memorial) {
      return 'images/map_marker_memorial.png';
    } else if (type == AttractionType.Stadium) {
      return 'images/map_marker_stadium.png';
    } else if (type == AttractionType.Park) {
      return 'images/map_marker_park.png';
    } else {
      throw ArgumentError('No such icon for id: $id');
    }
  }

  static AttractionType getTypeById(int id) {
    int res = (id / 100).toInt();

    if (res == 0) {
      return AttractionType.Museum;
    } else if (res == 1) {
      return AttractionType.Theatre;
    } else if (res == 2) {
      return AttractionType.Memorial;
    } else if (res == 3) {
      return AttractionType.Stadium;
    } else if (res == 4) {
      return AttractionType.Park;
    } else {
      throw ArgumentError('No such type for id: $id');
    }
  }
}
