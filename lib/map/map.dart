import 'package:art_guide_flutter/bloc/attractions_list_bloc.dart';
import 'package:art_guide_flutter/bloc/shared/map_state_bloc.dart';
import 'package:art_guide_flutter/bloc/shared/wiki_details_current_bloc.dart';
import 'package:art_guide_flutter/components/bottom_nav_bar.dart';
import 'package:art_guide_flutter/components/path_bottom_info.dart';
import 'package:art_guide_flutter/main/app_router.dart';
import 'package:art_guide_flutter/model/attraction.dart';
import 'package:art_guide_flutter/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';
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
  Widget build(BuildContext ctx) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor:
          AppColors.colorGreenStatus, //or set color with: Color(0xFF0000FF)
    ));

    var mapController = MapController();

    AttractionListBloc listBloc = Provider.of<AttractionListBloc>(ctx);
    WikiDetailsSharedBloc placeBloc = Provider.of<WikiDetailsSharedBloc>(ctx);
    MapStateBloc mapStateBloc = Provider.of<MapStateBloc>(ctx);
    MapState mapState = mapStateBloc.currentMapState;

    BottomNavBar bottomNavBar = BottomNavBar();
    PathInfoBottomNavBar pathBar = new PathInfoBottomNavBar();

    Widget bottomAppBar = (mapState == MapState.SEARCIHNG ||
            mapState == MapState.SHOWING_PLACE_INFO)
        ? bottomNavBar
        : pathBar;

    return Scaffold(
      body: Stack(children: [
        FlutterMap(
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
              markers: listBloc.attractions
                  .map((place) => makeMarker(ctx, place))
                  .toList(),
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
        buildMarkerInfoView(mapStateBloc, placeBloc)
      ]),
      bottomNavigationBar: bottomAppBar,
    );
  }

  Visibility buildMarkerInfoView(
      MapStateBloc mapStateBloc, WikiDetailsSharedBloc placeBloc) {
    MapState mapState = mapStateBloc.currentMapState;
    return Visibility(
      visible: mapState == MapState.SHOWING_PLACE_INFO,
      child: Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 80, bottom: 30),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverGroupBuilder(
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/main_map_graphic.png'),
                        fit: BoxFit.fill),
                    shape: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.none,
                      width: 1,
                    ),
                  ),
                  child: SliverList(
                      delegate:
                          SliverChildListDelegate(this.buildWidgets(context))))
            ],
          ),
        ),
      ),
    );
  }

  Marker makeMarker(BuildContext ctx, Place place) {
    var markerBuilder = (ctx) {
      String iconPath = MarkerUtil.getMarkerIconPathById(place.id);

      return Container(
        child: IconButton(
            icon: Image.asset(iconPath),
            onPressed: () => onMarkerClicked(ctx, place)),
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

  void onMarkerClicked(BuildContext ctx, Place place) {
    /*Scaffold.of(ctx).showSnackBar(new SnackBar(
      content: new Text(place.title),
      duration: Duration(seconds: 1),
    ));*/

    WikiDetailsSharedBloc placeBloc = Provider.of<WikiDetailsSharedBloc>(ctx);
    MapStateBloc mapStateBloc = Provider.of<MapStateBloc>(ctx);

    placeBloc.setCurrentAttraction(place);
    mapStateBloc.setMapState(MapState.SHOWING_PLACE_INFO);
  }

  List<Widget> buildWidgets(BuildContext ctx) {
    MapStateBloc mapStateBloc = Provider.of<MapStateBloc>(ctx);
    WikiDetailsSharedBloc placeBloc = Provider.of<WikiDetailsSharedBloc>(ctx);

    var list = List<Widget>();
    list.add(Material(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  placeBloc.currentAttraction.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Image.asset('images/close_sign.png'),
                  onPressed: () => mapStateBloc.setMapState(MapState.SEARCIHNG))
            ],
          ),
          Image.asset(placeBloc.currentAttraction.imageBig),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: FlatButton(
                  shape: StadiumBorder(),
                  color: AppColors.colorGreen,
                  onPressed: () => Navigator.pushNamed(context, AppRouter.WIKI_DETAILS_PAGE),
                  child:
                      Text('Подробнее', style: TextStyle(color: Colors.white)),
                ),
              ),
              IconButton(
                onPressed: () => mapStateBloc.setMapState(MapState.GETTING_FIRST_ROUTE),
                icon: Container(
                  child: Image.asset('images/build_road_red.png'),
                ),
              )
            ],
          )
        ],
      ),
    ));
    return list;
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
      home: MultiProvider(providers: [
        ChangeNotifierProvider<AttractionListBloc>(
          builder: (_) => AttractionListBloc(),
        ),
        ChangeNotifierProvider<WikiDetailsSharedBloc>(
          builder: (_) => WikiDetailsSharedBloc(),
        ),
        ChangeNotifierProvider<MapStateBloc>(
          builder: (_) => MapStateBloc(),
        )
      ], child: MapPage()),
    );
  }
}

void main() {
  runApp(MyApp());
}
