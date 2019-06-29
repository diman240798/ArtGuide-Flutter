import 'package:art_guide_flutter/components/bottom_nav_menu.dart';
import 'package:art_guide_flutter/ui/colors.dart';
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

class ListPageSate extends State<ListPage>
    with TickerProviderStateMixin<ListPage> {
  AnimationController _hide;

  @override
  void initState() {
    super.initState();
    _hide = AnimationController(vsync: this, duration: kThemeAnimationDuration);
  }

  @override
  void dispose() {
    _hide.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            _hide.forward();
            break;
          case ScrollDirection.reverse:
            _hide.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: AppColors.colorGreenStatus, //or set color with: Color(0xFF0000FF)
    ));

    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Scaffold(
        /*appBar: AppBar(
          title: Text('Культурный гид'),
          backgroundColor: Colors.teal,
        ),*/

        body: new CustomScrollView(slivers: <Widget>[
          const SliverAppBar(
            title: Align(child: Text('Культурный гид', style: TextStyle(color: Colors.black)), alignment: Alignment.centerRight,),
            backgroundColor: Colors.transparent,
            floating: true,
          ),
          SliverGroupBuilder(
              decoration: ShapeDecoration(
                image: DecorationImage(
                    image: AssetImage('images/main_map_graphic.png'),
                    fit: BoxFit.fill
                ),
                shape: Border.all(
                  color: Colors.grey,
                  style: BorderStyle.none,
                  width: 1,
                ),
              ),
              child: SliverList(
                  delegate: SliverChildListDelegate(buildTextViews(50, context))))
        ]),
        bottomNavigationBar: ClipRect(
          child: SizeTransition(
            sizeFactor: _hide,
            axisAlignment: -1.0,
            child: BottomAppBar(
              /* currentIndex: _currentIndex,
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },*/

              child: BottomNavigationMenu(),
            ),
          ),
        ),
      ),
    );
  }
}

List buildTextViews(int count, BuildContext context) {
  List<Widget> strings = List();
  for (int i = 0; i < count; i++) {
    var card = Container(
      margin: EdgeInsets.only(bottom: 20, right: 20),
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: new BorderRadius.only(
              bottomRight: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0))),

      child: InkWell(
        onTap: () {},
        child: Row(
          children: <Widget>[
            // ICON
            Image.asset(
                'images/memorial_kirovu_small.jpg',
                width: MediaQuery.of(context).size.width * 0.3,
                fit: BoxFit.fill,
              ),

            // TEXT
            Column(
              children: <Widget>[
                // TITLE
                Text('Title', style: Theme.of(context).textTheme.headline),
                // DESCRIPTION
                Text('Description', maxLines: 3, style: Theme.of(context).textTheme.body2),

              ],
            ),
          ],
        ),
      ),
    );

    /*SizedBox(
      height: 128,
      child: Card(
        child: new Material(
          color: Colors.transparent,
          child: new InkWell(

            child:  Row(
              children: <Widget>[
                // icon
                Image.asset('images/memorial_kirovu_small.jpg', width: MediaQuery.of(context).size.width * 0.3,),
                // title, description
                Column(children: <Widget>[
                  Text('Item $i', style: Theme.of(context).textTheme.headline),
                ],),

              ],
            ),
          ),
        ),
    ));*/

    strings.add(card);
  }
  return strings;
}

void main() {
  runApp(MaterialApp(home: ListPage()));
}

/*
SizedBox.expand(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 128,
                child: Card(
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                      child: Text('Item $index',
                          style: Theme.of(context).primaryTextTheme.display1),
                    ),
                  ),
                ),
              );
            },
          ),
        )
* */
