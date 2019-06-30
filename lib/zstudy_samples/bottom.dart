import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _hideButtonController;

  var _isVisible;
  @override
  initState() {
    super.initState();
    _isVisible = true;
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
          print("**** $_isVisible up");
        });
      }
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
          print("**** $_isVisible down");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      drawer: Container(),
      body: NestedScrollView(
        controller: _hideButtonController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[Text("Культурный гид")],
              ),
              elevation: 10.0,
              automaticallyImplyLeading: false,
              floating: true,
            )
          ];
        },
        body: new ListView(
          children: children(),
        ),
      ),

      bottomNavigationBar: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: _isVisible ? 60.0 : 0.0,
        child: _isVisible
            ? AnimatedContainer(
          duration: Duration(milliseconds: 10),
          height: _isVisible ? 60.0 : 0.0,
          child: _isVisible
              ? new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard),
                title: Text('Offers'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                title: Text('Account'),
              ),
            ],
            currentIndex: 0,
          )
              : Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
          ),
        )
            : Container(
          color: Theme.of(context).primaryColor,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }

  List<Widget> children() {
    return <Widget>[
      const Text('I\'m dedicating every day to you'),
      const Text('Domestic life was never quite my style'),
      const Text('When you smile, you knock me out, I fall apart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('I realize I am crazy'),
      const Text('I\'m dedicating every day to you'),
      const Text('Domestic life was never quite my style'),
      const Text('When you smile, you knock me out, I fall apart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('And I thought I was so smart'),
      const Text('I realize I am crazy'),
    ];
  }
}
