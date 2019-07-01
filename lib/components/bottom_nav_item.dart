import 'package:flutter/material.dart';

class BottomMenuItem extends StatelessWidget {
  final String iconPath;
  final bool needDevider;

  const BottomMenuItem({Key key, this.iconPath, this.needDevider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double itemHeight = MediaQuery.of(context).size.height * 0.09;

    return Row(
      children: <Widget>[
        Image.asset(
          iconPath,
          height: itemHeight,
          width: MediaQuery.of(context).size.width * 0.19,
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
