import 'dart:convert';
import 'package:art_guide_flutter/api/model/route_response.dart';
import 'package:art_guide_flutter/api/routes/routes.dart';
import 'package:http/http.dart';

Future<RouteApiReponse> getRouteBetweenLocations(List<PointApiModel> locations) async {
  var url = Routes.getRouteBetweenLocationsURL(locations);
  var response = await get(url);
  var body = response.body;
  var decoded = json.decode(body);
  var routeApiReponse = RouteApiReponse.fromJson(decoded);
  return routeApiReponse;
}

void main() => getRouteBetweenLocations([
      PointApiModel(latitude: 52.50931, longitude: 13.42936),
      PointApiModel(latitude: 52.50274, longitude: 13.43872)
    ]).then((resp) => print(resp.toString()));
