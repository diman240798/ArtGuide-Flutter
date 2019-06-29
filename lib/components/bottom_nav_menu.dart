import 'package:flutter/material.dart';

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
      height: MediaQuery.of(context).size.width * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 1.0,
            width: MediaQuery.of(context).size.width * 0.9,
            color: Colors.black,
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          ),
          Row(
            children: <Widget>[
              BottomMenuItem(
                  iconPath: allDestinations[0], needDevider: true),
              BottomMenuItem(
                  iconPath: allDestinations[1], needDevider: true),
              BottomMenuItem(
                  iconPath: allDestinations[2], needDevider: true),
              BottomMenuItem(
                  iconPath: allDestinations[3], needDevider: true),
              BottomMenuItem(
                  iconPath: allDestinations[4], needDevider: false),
            ],
          )
        ],
      ),
    );
    ;
  }
}

class BottomMenuItem extends StatelessWidget {
  final String iconPath;
  final bool needDevider;

  const BottomMenuItem({Key key, this.iconPath, this.needDevider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double itemHeight = MediaQuery.of(context).size.width * 0.08;

    return Row(
      children: <Widget>[
        Image.asset(
          iconPath,
          height: itemHeight,
          width: MediaQuery.of(context).size.width * 0.19,
        ),
        if (this.needDevider)
          Container(
            height: itemHeight,
            width: .5,
            color: Colors.black,
            margin: EdgeInsets.only(top: 10.0, bottom: 10),
            padding: EdgeInsets.only(bottom: 10.0),
          ),
      ],
    );
  }
}
