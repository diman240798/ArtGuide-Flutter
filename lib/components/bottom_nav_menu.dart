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
          Container(
            height: 1.0,
            width: MediaQuery.of(context).size.width * 0.9,
            color: Colors.black,
            margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 2),
          ),
          Row(
            children: <Widget>[
              BottomMenuItem(iconPath: allDestinations[0], needDevider: true),
              BottomMenuItem(iconPath: allDestinations[1], needDevider: true),
              BottomMenuItem(iconPath: allDestinations[2], needDevider: true),
              BottomMenuItem(iconPath: allDestinations[3], needDevider: true),
              BottomMenuItem(iconPath: allDestinations[4], needDevider: false),
            ],
          )
        ],
      ),
    );
    ;
  }
}
