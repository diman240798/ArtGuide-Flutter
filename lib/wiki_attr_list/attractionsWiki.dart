import 'package:art_guide_flutter/components/bottom_nav_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Scaffold(
        /*appBar: AppBar(
          title: Text('Культурный гид'),
          backgroundColor: Colors.teal,
        ),*/

        body: new CustomScrollView(slivers: <Widget>[
          const SliverAppBar(
            title: const Text('Культурный гид'),
            floating: true,
          ),
          new SliverList(
              delegate:
                  new SliverChildListDelegate(buildTextViews(50, context)))
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
    var card = Card(
        child: InkWell(
          onTap: () {},
          child: Row(
            children: <Widget>[
              // ICON
              ClipRRect(
                borderRadius: BorderRadius.only( topLeft: Radius.circular(5.0), bottomLeft: Radius.circular(5.0)),
                child: Image.asset(
                  'images/memorial_kirovu_small.jpg',
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 120,
                  fit: BoxFit.fill,
                ),
              ),


              Column(
                children: <Widget>[
                  // TITLE
                  Text('Title', style: Theme.of(context).textTheme.headline),
                  // DESCRIPTION
                  Text('Description', style: Theme.of(context).textTheme.body1),
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
