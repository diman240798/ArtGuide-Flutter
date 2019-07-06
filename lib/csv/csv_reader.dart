import 'dart:io';

import 'package:art_guide_flutter/model/attraction.dart';
import 'package:art_guide_flutter/repo/place_repo.dart';
import 'package:art_guide_flutter/util/place_util.dart';
import 'package:art_guide_flutter/wiki_attr_list/attractionsWiki.dart';
import 'package:synchronized/synchronized.dart';

import 'file_getter.dart';

class CsvReader {
  static List<Place> data = List();

  static List<Place> getData(AttractionListBloc list, PlaceRepository placeRepository) {
    if (data.isEmpty) {
      var lock = new Lock();
      lock.synchronized(() async {
        data = await readData();
        placeRepository.places = data;
        list.setAttractions(data);
      });
    }
    return data;
  }

  static Future<List<Place>> readData() async {

    String commentariy = "#";
    String separator = ",";

    String data = await FutterFileGetter.getDataFile();

    List<String> lines = data.split('\n');


    return lines.map((line) {
      if (line.startsWith(commentariy)) return null;

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

      return place;
    }).where((place) => place != null).toList(growable: false);

  }

  Place getPlaceById(int placeId) {
    data.firstWhere((place) => place.id == placeId,
        orElse: throw new ArgumentError(
            "No such place with id: " + placeId.toString()));
  }
}
