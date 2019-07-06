import 'package:art_guide_flutter/model/attraction_type.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_item.dart';

const List<String> allDestinations = <String>[
  'images/item_museum.png',
  'images/item_theatre.png',
  'images/item_memorial.png',
  'images/item_stadium.png',
  'images/item_park.png'
];

class BottomNavigationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.111,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 1.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 2),
              ),
              Row(
                children: <Widget>[
                  BottomMenuItem(AttractionType.Museum,
                      iconPath: allDestinations[0], needDevider: true),
                  BottomMenuItem(AttractionType.Theatre,
                      iconPath: allDestinations[1], needDevider: true),
                  BottomMenuItem(AttractionType.Memorial,
                      iconPath: allDestinations[2], needDevider: true),
                  BottomMenuItem(AttractionType.Stadium,
                      iconPath: allDestinations[3], needDevider: true),
                  BottomMenuItem(AttractionType.Park,
                      iconPath: allDestinations[4], needDevider: false),
                ]
              )
            ],
          )
        ],
      ),
    );
    ;
  }
}
