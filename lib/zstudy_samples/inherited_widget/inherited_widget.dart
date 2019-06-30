import 'package:flutter/material.dart';


void main() {
  runApp(MyInherited(child: MyStatelessWidget()));
}

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyInheritedState inherited = MyInherited.of(context);

    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Text(inherited.counter.toString()),
          ),
        ),
        floatingActionButton:
        Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          FloatingActionButton(
              child: Icon(Icons.add), onPressed: () => inherited.increment()),
          SizedBox(width: 10),
          FloatingActionButton(
              child: Icon(Icons.remove), onPressed: () => inherited.decrement()),
        ]),
      ),
    );
  }
}

class MyInherited extends StatefulWidget {
  Widget child;

  MyInherited({this.child});

  @override
  MyInheritedState createState() => new MyInheritedState();

  static MyInheritedState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_MyInherited) as _MyInherited).data;
  }
}

class MyInheritedState extends State<MyInherited> {
  int _counter = 0;
  // only expose a getter to prevent bad usage
  int get counter => _counter;

  void increment() {
    setState(() {
      _counter +=1;
    });
  }

  void decrement() {
    setState(() {
      _counter -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new _MyInherited(
      data: this,
      child: widget.child,
    );
  }
}

/// Only has MyInheritedState as field.
class _MyInherited extends InheritedWidget {
  final MyInheritedState data;

  _MyInherited({Key key, this.data, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_MyInherited old) {
    return true;
  }
}
