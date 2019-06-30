import 'package:flutter/material.dart';

void main() {
  runApp(StatefulCounterWidget());
}

class StatefulCounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CounterState();
  }

}

class CounterState extends State<StatefulCounterWidget> {
  int counter = 0;


  increment() {
    setState(() {
      counter += 1;
    });
  }

  decrement() {
    setState(() {
      counter -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
            child: Text(counter.toString()),
          ),
        ),
        floatingActionButton:
        Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          FloatingActionButton(
              child: Icon(Icons.add), onPressed: () => increment()),
          SizedBox(width: 10),
          FloatingActionButton(
              child: Icon(Icons.remove), onPressed: () => decrement()),
        ]),
      ),
    );
  }

}