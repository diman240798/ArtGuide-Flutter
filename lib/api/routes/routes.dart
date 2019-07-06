import 'package:art_guide_flutter/api/model/route_response.dart';

class Routes {
  static String HOST = 'https://api.tomtom.com';

  static String getRouteBetweenLocationsURL(List<PointApiModel> locations) {
    var locs = locations.map((point) => point.toString()).join(':');
    return '$HOST/routing/1/calculateRoute/${locs}/json?key=kn5AljsbLA3YmU76MZNjShPGVLaUSdKz';
  }
}