import 'package:art_guide_flutter/model/attraction_type.dart';
import 'package:art_guide_flutter/wiki_attr_list/attractionsWiki.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomMenuItem extends StatelessWidget {
  final String iconPath;
  final bool needDevider;

  final AttractionType attractionType;

  const BottomMenuItem(this.attractionType, {Key key, this.iconPath, this.needDevider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double itemHeight = MediaQuery.of(context).size.height * 0.09;

    AttractionListBloc listBloc = Provider.of<AttractionListBloc>(context);

    return Row(
      children: <Widget>[
        IconButton(
          onPressed: () => listBloc.setAttractionsByType(attractionType), // change Attractions
          icon: Image.asset(iconPath,
              height: itemHeight,
              width: MediaQuery.of(context).size.width * 0.19),
        ),
        if (this.needDevider)
          Container(
            height: itemHeight * 0.8,
            width: .5,
            color: Colors.black,
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          ),
      ],
    );
  }
}
