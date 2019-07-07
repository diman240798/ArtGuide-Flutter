import 'package:art_guide_flutter/model/attraction_type.dart';
import 'package:flutter/material.dart';

import 'bottom_images_list.dart';
import 'bottom_nav_item.dart';


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
              Row(children: <Widget>[
                BottomMenuItem(AttractionType.Museum,
                    bottomMenuItemImage: BottomMenuImages.images[0], needDevider: true),
                BottomMenuItem(AttractionType.Theatre,
                    bottomMenuItemImage: BottomMenuImages.images[1], needDevider: true),
                BottomMenuItem(AttractionType.Memorial,
                    bottomMenuItemImage: BottomMenuImages.images[2], needDevider: true),
                BottomMenuItem(AttractionType.Stadium,
                    bottomMenuItemImage: BottomMenuImages.images[3], needDevider: true),
                BottomMenuItem(AttractionType.Park,
                    bottomMenuItemImage: BottomMenuImages.images[4], needDevider: false),
              ])
            ],
          )
        ],
      ),
    );
    ;
  }
}
