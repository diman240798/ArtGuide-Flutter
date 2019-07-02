import 'dart:io';

import 'package:art_guide_flutter/model/attraction.dart';
import 'package:art_guide_flutter/util/place_util.dart';

class CsvReader {
  List<Place> data;

  List<Place> getData() {
    if (data == null) {
      data = readData();
    }
    return data;
  }

  static List<Place> readData() {
    List<Place> result = [];

    String commentariy = "#";
    String separator = ",";

    File('raw/data.csv').readAsString().then((data) {
      List<String> lines = data.split('\n');
      lines.map((line) {
        if (line.startsWith(commentariy)) return;

        List<String> splitDescription = line.split("::");

        List<String> tokens = splitDescription[0].split(separator);
        String description = splitDescription[1];

        // Read the data and store it.
        String id_s = tokens[0];
        int id = int.parse(id_s);
        String title = tokens[1];
        String latitude = tokens[2];
        String longitude = tokens[3];
        String imageSmall = tokens[4];
        String imageBig = tokens[5];

        Place place = Place(
            id,
            title,
            double.parse(latitude),
            double.parse(longitude),
            'images/$imageSmall.png',
            'images/$imageBig.png',
            description,
            PlaceUtil.getTypeByPlaceId(id));
        result.add(place);
      });
    });

    return result;
  }

  Place getPlaceById(int placeId) {
    data.firstWhere((place) => place.id == placeId,
        orElse: throw new ArgumentError(
            "No such place with id: " + placeId.toString()));
  }
}
