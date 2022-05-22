import 'dart:math';

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class FakeLocation {
  static double _randomDouble(Random source, double min, double max) {
    return source.nextDouble() * (max - min) + min;
  }

  static LatLng random() {
    Random random = Random();
    return LatLng(
      _randomDouble(random, -37.823118, -37.819758),
      _randomDouble(random, 145.035384, 145.040224),
    );
  }
}

class Dimensions {
  static const btnHeight60 = 60.0;
  static const margin15 = 15.0;
  static const margin5 = 5.0;
  static const radius10 = 10.0;
  static const staticMapHeight = 100.0;
  static const staticMapWidth = 300.0;
}

class Colours {
  static const Color kErrorRed = Colors.redAccent;
  static const Color kDarkGray = Color(0xFFA3A3A3);
  static const Color kLightGray = Color(0xFFF1F0F5);

  static const statusCompleted = Colors.green;
  static const statusInProgress = Colors.blue;
  static const statusPending = Colors.orange;
}

class ColourInts {
  static int statusCompleted = Colors.green.value;
  static int statusInProgress = Colors.blue.value;
  static int statusPending = Colors.orange.value;
}
