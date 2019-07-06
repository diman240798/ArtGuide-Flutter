class RouteApiReponse {
  List<RouteApiModel> routes;

  RouteApiReponse({this.routes}) {}

  factory RouteApiReponse.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> routesJson = List<Map<String, dynamic>>.from(json['routes']);
    return RouteApiReponse(
        routes: routesJson.map<RouteApiModel>((routeJson) => RouteApiModel.fromJson(routeJson)).toList()
    );
  }
}

class RouteApiModel {
  List<LegApiModel> legs;

  RouteApiModel({this.legs}) {}

  factory RouteApiModel.fromJson(Map<String, dynamic> json) {
    var legsJson = json['legs'];
    return RouteApiModel(
        legs: legsJson.map<LegApiModel>((legJson) => LegApiModel.fromJson(legJson)).toList()
    );
  }
}

class LegApiModel {
  SummaryApiModel summary;
  List<PointApiModel> points;

  LegApiModel({this.summary, this.points}) {}

  factory LegApiModel.fromJson(Map<String, dynamic> json) {
    var pointsJson = json['points'];
    return LegApiModel(
        summary: SummaryApiModel.fromJson(json['summary']),
        points: pointsJson.map<PointApiModel>((pointJson) => PointApiModel.fromJson(pointJson)).toList()
    );
  }
}

class SummaryApiModel {
  int lengthInMeters;
  int travelTimeInSeconds;
  int trafficDelayInSeconds;
  String departureTime;
  String arrivalTime;

  SummaryApiModel({this.lengthInMeters, this.travelTimeInSeconds, this.trafficDelayInSeconds, this.departureTime, this.arrivalTime}) {}

  factory SummaryApiModel.fromJson(Map<String, dynamic> json) {
    return SummaryApiModel(
        lengthInMeters: json['lengthInMeters'],
        travelTimeInSeconds: json['travelTimeInSeconds'],
        trafficDelayInSeconds: json['trafficDelayInSeconds'],
        departureTime: json['departureTime'],
        arrivalTime: json['arrivalTime']
    );
  }
}

class PointApiModel {
  double latitude;
  double longitude;

  PointApiModel({this.latitude, this.longitude}) {}

  factory PointApiModel.fromJson(Map<String, dynamic> json) {
    return PointApiModel(
        latitude: json['latitude'],
        longitude: json['longitude']
    );
  }

  @override
  String toString() {
    return '${latitude.toString()},${longitude.toString()}';
  }
}