import 'package:art_guide_flutter/components/bottom_nav_bar.dart';
import 'package:art_guide_flutter/ui/colors.dart';
import './wiki_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListPageSate();
  }
}

class ListPageSate extends State<ListPage> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor:
          AppColors.colorGreenStatus, //or set color with: Color(0xFF0000FF)
    ));

    BottomNavBar  bottomNavBar = BottomNavBar();

    return NotificationListener<ScrollNotification>(
      onNotification: (notificaton) => bottomNavBar.navBarState.handleScrollNotification(notificaton),
      child: Scaffold(
        body: new CustomScrollView(slivers: <Widget>[
          const SliverAppBar(
            title: Align(
              child:
                  Text('Культурный гид', style: TextStyle(color: Colors.black)),
              alignment: Alignment.centerRight,
            ),
            backgroundColor: Colors.transparent,
            floating: true,
          ),
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
                      SliverChildListDelegate(WikiListBuilder.buildTextViews(50, context))))
        ]),
        bottomNavigationBar: bottomNavBar,
      ),
    );
  }
}


void main() {
  runApp(MaterialApp(home: ListPage()));
}
