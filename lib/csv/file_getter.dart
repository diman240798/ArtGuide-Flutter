import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class FutterFileGetter {
  static Future<String> getDataFile() async {
    return await rootBundle.loadString('raw/data.csv');
  }
}