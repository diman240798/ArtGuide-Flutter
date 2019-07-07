import 'package:art_guide_flutter/bloc/attractions_list_bloc.dart';
import 'package:art_guide_flutter/components/bottom_nav_bar.dart';
import 'package:art_guide_flutter/model/attraction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';

import 'marker_util.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  int pointIndex;
  /*List<LatLng> points = [
    LatLng(51.5, -0.09),
    LatLng(49.8566, 3.3522),
  ];*/

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mapController = MapController();

    AttractionListBloc listBloc = Provider.of<AttractionListBloc>(context);

    BottomNavBar bottomNavBar = BottomNavBar();

    return Scaffold(
      body: FlutterMap(
        mapController: mapController,
        options: new MapOptions(
          center: LatLng(47.219196, 39.702261),
          zoom: 5,
          plugins: [
            MarkerClusterPlugin(),
          ],
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          PolylineLayerOptions(
            polylines: [
             /* Polyline(points: points, strokeWidth: 4.0, color: Colors.purple),*/
            ],
          ),
          MarkerClusterLayerOptions(
            maxClusterRadius: 120,
            height: 40,
            width: 40,
            anchorPos: AnchorPos.align(AnchorAlign.center),
            fitBoundsOptions: FitBoundsOptions(
              padding: EdgeInsets.all(50),
            ),
            markers: listBloc.attractions.map(makeMarker).toList(),
            polygonOptions: PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 3),
            builder: (context, markers) {
              return FloatingActionButton(
                child: Text(markers.length.toString()),
                onPressed: null,
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: bottomNavBar,
    );
  }

  Marker makeMarker(Place place) {


    var markerBuilder = (ctx) {
      String iconPath = MarkerUtil.getMarkerIconPathById(place.id);

      return Container(
          child: IconButton(
              icon: Image.asset(iconPath),
              onPressed: () => Scaffold.of(ctx).showSnackBar(new SnackBar(
                    content: new Text(place.title),
                    duration: Duration(seconds: 1),
                  ))),
        );
    };

    double latitude = place.latitude;
    double longitude = place.longitude;

    return Marker(
      anchorPos: AnchorPos.align(AnchorAlign.center),
      height: 30,
      width: 30,
      point: LatLng(latitude, longitude),
      builder: markerBuilder,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<AttractionListBloc>(
        builder: (_) => AttractionListBloc(),
        child: MapPage(),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
