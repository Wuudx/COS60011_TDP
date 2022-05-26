import 'package:council_reporting/data/db.dart';
import 'package:council_reporting/data/numbers.dart';
import 'package:council_reporting/data/page_navigation.dart';
import 'package:council_reporting/data/path_arguments.dart';
import 'package:council_reporting/data/strings.dart';
import 'package:council_reporting/pages/issue_submitted_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class MapPage extends StatefulWidget {
  final User user;

  const MapPage({required this.user, Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late User _user;
  late DeviceDatabase database;
  late LocationData _userLocation;

  @override
  void initState() {
    super.initState();
    _user = widget.user;
    LatLng location = FakeLocation.random();
    _userLocation = LocationData.fromMap(
      {'latitude': location.latitude, 'longitude': location.longitude},
    );
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    database = Provider.of<DeviceDatabase>(context);
  }

  _buildMarkerList(List<Issue> list, LocationData location) {
    List<Marker> markers = [];

    for (Issue issue in list) {
      markers.add(_marker(issue));
    }

    markers.add(
      Marker(
        width: 45.0,
        height: 45.0,
        point: LatLng(location.latitude!, location.longitude!),
        builder: (context) => const Icon(
          Icons.flag,
          size: 45.0,
          color: Colors.blueAccent,
        ),
      ),
    );

    return MarkerLayerOptions(markers: markers);
  }

  Marker _marker(Issue issue) {
    return Marker(
      width: 45.0,
      height: 45.0,
      point: LatLng(issue.lat ?? 0, issue.long ?? 0),
      builder: (context) => IconButton(
        icon: Icon(
          issue.status == Strings.txtStatusComplete
              ? Icons.check_circle_rounded
              : Icons.report_problem_rounded,
        ),
        color: issue.status == Strings.txtStatusComplete
            ? Colours.statusCompleted
            : issue.status == Strings.txtStatusInProgress
                ? Colours.statusInProgress
                : Colours.statusPending,
        iconSize: 35.0,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topRight,
                      child: RawMaterialButton(
                        child: const Icon(
                          IconData(0xe16a, fontFamily: 'MaterialIcons'),
                          color: Colors.white,
                        ),
                        fillColor: Colors.blue,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        shape: const CircleBorder(),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      height: 450,
                      width: 380,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          SizedBox(
                            height: 160,
                            child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7ScilDQPL3aCn4nEs6nWtMFxZMIhr2Vl5nA&usqp=CAU',
                              width: 360,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            Strings.txtLastUpdateDate,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat('dd / MM / yyyy  hh:mm a')
                                .format(issue.lastUpdate ?? DateTime.now()),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            Strings.lblDescription,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            issue.description!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            Strings.lblLocation,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            issue.address ?? Strings.txtUnknownLocation,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            Strings.txtStatus,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            issue.status ?? Strings.txtStatusPending,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.lightBlue,
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (_, a1, a2) => IssueSubmittedPage(
                                      user: _user,
                                      issue: issue,
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                'Open Report',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  FlutterMap _flutterMap(MarkerLayerOptions? markers) {
    return FlutterMap(
      options: MapOptions(
        center:
            FakeLocation.midPoint(), // LatLng(_userLocation.latitude!, _userLocation.longitude!),
        minZoom: 17,
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
        if (markers != null) markers,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context)
              .pushNamed(
                PageName.complaint,
                arguments: IssueArguments(user: _user, location: _userLocation),
              )
              .then((value) => setState((() {})));
        },
        tooltip: 'Report issue',
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          StreamBuilder(
            stream: Stream.fromFuture(
              // database.getAllIssues(),
              database.getIssuesWithinRadius(_userLocation.latitude!, _userLocation.longitude!),
            ),
            builder: (context, AsyncSnapshot<List<Issue>> snapshot) {
              if (snapshot.hasData) {
                return _flutterMap(_buildMarkerList(snapshot.data!, _userLocation));
              } else {
                return _flutterMap(null);
              }
            },
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(
                    MaterialCommunityIcons.trophy,
                    color: Colors.black,
                  ),
                  color: Colors.white,
                  iconSize: 50,
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      PageName.profile,
                      arguments: BaseArguments(user: _user),
                    );
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.my_location,
                    color: Colors.black,
                  ),
                  color: Colors.white,
                  iconSize: 50,
                  onPressed: () {
                    LatLng location = FakeLocation.random();
                    setState(() {
                      _userLocation = LocationData.fromMap(
                        {'latitude': location.latitude, 'longitude': location.longitude},
                      );
                    });
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
