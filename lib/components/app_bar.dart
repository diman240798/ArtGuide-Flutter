import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 100),
        Image.asset('images/small_sign.png', height: 35),
        SizedBox(width: 20),
        Text('Культурный гид', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
      ],
    );
  }
}