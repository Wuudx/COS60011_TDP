import 'package:council_reporting/data/map_key.dart';
import 'package:flutter/material.dart';

import 'numbers.dart';

const String baseApiUrl = "https://maps.googleapis.com/maps/api/geocode";
const String jsonLatLng = "/json";

const int staticMapZoomLevel = 16;

class GeoCodingApi {

  Future<Widget> getMap(double lat, double lng) async {
    return Padding(
      padding:  const EdgeInsets.only(bottom: Dimensions.margin15),
      child: Image.network(
        "https://maps.googleapis.com/maps/api/staticmap?&zoom=$staticMapZoomLevel&size=${Dimensions.staticMapWidth}x${Dimensions.staticMapHeight}&maptype=roadmap&markers=color:0xFF0000%7C$lat,$lng&key=${MapKeys.google}",
        width: Dimensions.staticMapWidth.toDouble(),
        height: Dimensions.staticMapHeight.toDouble(),
        gaplessPlayback: true,
      ),
    );
  }
}
