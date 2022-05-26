import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'numbers.dart';

const String baseApiUrl = "https://maps.googleapis.com/maps/api/geocode";
const String jsonLatLng = "/json";

const double staticMapZoomLevel = 17.5;

class GeoCodingApi {
  Future<Widget> getMap(double lat, double lng) async {
    return AbsorbPointer(
      absorbing: true,
      child: Padding(
        padding: const EdgeInsets.only(bottom: Dimensions.margin15),
        child: SizedBox(
          width: Dimensions.staticMapWidth,
          height: Dimensions.staticMapHeight,
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(lat, lng),
              minZoom: staticMapZoomLevel,
              allowPanning: false,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/andrestherex/cl38qenvf002s14kfr9rlpagr/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYW5kcmVzdGhlcmV4IiwiYSI6ImNsMzhyaWRkZDAwNDAzanF5anFwcWpoMzgifQ.cj2d12HE6FK_SKNFRd9YSg",
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1IjoiYW5kcmVzdGhlcmV4IiwiYSI6ImNsMzhyaWRkZDAwNDAzanF5anFwcWpoMzgifQ.cj2d12HE6FK_SKNFRd9YSg',
                  'id': 'mapbox.mapbox-streets-v8'
                },
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    width: 45.0,
                    height: 45.0,
                    point: LatLng(lat, lng),
                    builder: (context) => const Icon(
                      Icons.flag,
                      size: 45.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
