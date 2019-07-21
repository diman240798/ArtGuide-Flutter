import 'package:flutter/material.dart';

class CounterBloc with ChangeNotifier {
  int _counter;

  CounterBloc(this._counter);

  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}