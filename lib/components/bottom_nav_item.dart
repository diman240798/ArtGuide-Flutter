import 'package:art_guide_flutter/bloc/attractions_list_bloc.dart';
import 'package:art_guide_flutter/model/attraction_type.dart';
import 'package:art_guide_flutter/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_images_list.dart';

class BottomMenuItem extends StatelessWidget {
  final BottomMenuItemImage bottomMenuItemImage;
  final bool needDevider;

  final AttractionType attractionType;

  const BottomMenuItem(this.attractionType,
      {Key key, this.bottomMenuItemImage, this.needDevider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double itemHeight = MediaQuery.of(context).size.height * 0.095;

    AttractionListBloc listBloc = Provider.of<AttractionListBloc>(context);

    String iconPath = listBloc.currentType == attractionType
        ? bottomMenuItemImage.chosenPath
        : bottomMenuItemImage.usualPath;

    return Row(
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.19,
          height: itemHeight,
          child: IconButton(
              iconSize: 55,
              splashColor: AppColors.colorGreen,
              onPressed: () => listBloc.setAttractionsByType(attractionType),
              // change Attractions
              icon: Image.asset(iconPath, fit: BoxFit.fitWidth)),
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
