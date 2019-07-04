import 'dart:convert';
import 'package:art_guide_flutter/api/model/route_response.dart';
import 'package:http/http.dart';

String HOST = 'https://api.tomtom.com';

String makeUrl(List<PointApiModel> locations) {
  var locs = locations.map((point) => point.toString()).join(':');
  return '$HOST/routing/1/calculateRoute/${locs}/json?key=kn5AljsbLA3YmU76MZNjShPGVLaUSdKz';
}

void makeRequest(List<PointApiModel> locations) {
  var url = makeUrl(locations);
  var future = get(url);
  future.then((response) {
    var body = response.body;
    return RouteApiReponse.fromJson(json.decode(body));
  }).catchError((error) => print(error));
}

void main() => makeRequest([PointApiModel(latitude: 52.50931, longitude: 13.42936), PointApiModel(latitude: 52.50274, longitude: 13.43872)]);
