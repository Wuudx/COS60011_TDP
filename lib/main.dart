import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );

  }

}

class MyHomePage extends StatefulWidget {
  @override
    MyHomePageState createState() => MyHomePageState();

}



class MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlutterMap(
            options: MapOptions(
                center: LatLng(-37.8221, 145.0389), minZoom: 10.0),
            layers: [
              TileLayerOptions(
                  urlTemplate: "https://api.mapbox.com/styles/v1/andrestherex/cl38qenvf002s14kfr9rlpagr/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYW5kcmVzdGhlcmV4IiwiYSI6ImNsMzhyaWRkZDAwNDAzanF5anFwcWpoMzgifQ.cj2d12HE6FK_SKNFRd9YSg",
                  additionalOptions: {
                    'accessToken': 'pk.eyJ1IjoiYW5kcmVzdGhlcmV4IiwiYSI6ImNsMzhyaWRkZDAwNDAzanF5anFwcWpoMzgifQ.cj2d12HE6FK_SKNFRd9YSg',
                    'id':'mapbox.mapbox-streets-v8'
                  }
              ),
              MarkerLayerOptions(markers: [
                Marker(
                    width: 45.0,
                    height: 45.0,
                    point: LatLng(-37.8221, 145.0389),
                    builder: (context) => Container(
                      child: IconButton(
                        icon: Icon(Icons.flag),
                        color: Colors.blueAccent,
                        iconSize: 55.0,
                        onPressed: (){},
                      ),
                    ),
                ),

                Marker(
                    width: 45.0,
                    height: 45.0,
                    point: LatLng(-37.8220, 145.0220),
                    builder: (context) => Container(
                      child: IconButton(
                        icon: Icon(Icons.report_problem_rounded),
                        color: Colors.red,
                        iconSize: 35.0,
                        onPressed: () {
                        },
                      ),
                    )
                )
                , Marker(
                    width: 45.0,
                    height: 45.0,
                    point: LatLng(-37.8420, 145.0240),
                    builder: (context) => Container(
                      child: IconButton(
                        icon: Icon(Icons.report_problem_rounded),
                        color: Colors.red,
                        iconSize: 35.0,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                elevation: 16,
                                child: Container(
                                  padding: EdgeInsets.all(20.0),
                                  margin: EdgeInsets.all(10.0),
                                  height: 430,
                                  width: 380,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                  ),
                                      SizedBox(height: 165,
                                          child: Container(
                                              child: Image.network(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7ScilDQPL3aCn4nEs6nWtMFxZMIhr2Vl5nA&usqp=CAU',
                                                width: 440,
                                              )
                                          )
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        "Date:",
                                        style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                      Text(
                                        "Mon 23 May",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        "Category:",
                                        style: TextStyle(
                                          fontSize:16, color:Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        "PUBLIC LITTER BINS - DAMAGED",
                                        style: TextStyle(
                                          fontSize:16, color:Colors.black,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        "Location:",
                                        style: TextStyle(
                                          fontSize:16, color:Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Location: John St, Hawthorn VIC 3122",
                                        style: TextStyle(
                                          fontSize:16, color:Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        "Status:",
                                        style: TextStyle(
                                          fontSize:16, color:Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "PENDING",
                                        style: TextStyle(
                                          fontSize:16, color:Colors.red,
                                        ),
                                      ),
                                      SizedBox(height: 30,
                                        child: Container(
                                          child:
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.lightBlue,
                                            ),
                                            onPressed: () {},
                                            child: const Text(
                                              'Open Report',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                      )
                                      )
                                    ],
                                  ),

                                ),

                              );

                            },
                          );
                        }
                        ,
                      ),
                    )
                )
                , Marker(
                    width: 45.0,
                    height: 45.0,
                    point: LatLng(-37.800, 145.0100),
                    builder: (context) => Container(
                      child: IconButton(
                        icon: Icon(Icons.report_problem_rounded),
                        color: Colors.orange,
                        iconSize: 35.0,
                        onPressed: () {
                        },
                      ),
                    )
                )
                , Marker(
                    width: 45.0,
                    height: 45.0,
                    point: LatLng(-37.820, 145.0100),
                    builder: (context) => Container(
                      child: IconButton(
                        icon: Icon(Icons.report_problem_rounded),
                        color: Colors.orange,
                        iconSize: 35.0,
                        onPressed: () {
                        },
                      ),
                    )
                )
                , Marker(
                    width: 45.0,
                    height: 45.0,
                    point: LatLng(-37.840, 145.0500),
                    builder: (context) => Container(
                      child: IconButton(
                        icon: Icon(Icons.report_problem_rounded),
                        color: Colors.orange,
                        iconSize: 35.0,
                        onPressed: () {
                        },
                      ),
                    )
                )
                , Marker(
                    width: 45.0,
                    height: 45.0,
                    point: LatLng(-37.810, 145.0530),
                    builder: (context) => Container(
                      child: IconButton(
                        icon: Icon(Icons.check_circle_rounded),
                        color: Colors.green,
                        iconSize: 35.0,
                        onPressed: () {
                        },
                      ),

                    )
                )
              ])
            ])

    );


  }

}
