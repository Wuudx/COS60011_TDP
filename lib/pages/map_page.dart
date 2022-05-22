import 'package:council_reporting/data/db.dart';
import 'package:council_reporting/data/numbers.dart';
import 'package:council_reporting/data/page_navigation.dart';
import 'package:council_reporting/data/path_arguments.dart';
import 'package:council_reporting/data/strings.dart';
import 'package:council_reporting/data/widgets.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _user = widget.user;
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    database = Provider.of<DeviceDatabase>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                PageName.map,
                style: TextStyle(fontSize: 30),
              ),
              const Text(
                Strings.txtNotImplemented,
                style: TextStyle(fontSize: 30),
              ),
              FormWidgets.textButtonTB(
                PageName.complaint,
                Colors.white,
                Colors.green,
                onClick: () {
                  LatLng location = FakeLocation.random();
                  LocationData locData = LocationData.fromMap(
                    {'latitude': location.latitude, 'longitude': location.longitude},
                  );
                  Navigator.of(context).pushNamed(
                    PageName.complaint,
                    arguments: IssueArguments(user: widget.user, location: locData),
                  );
                },
              ),
              FormWidgets.textButtonTB(
                'Print Issue within 150 metre radius',
                Colors.white,
                Colors.green,
                onClick: () async {
                  LatLng location = FakeLocation.random();
                  final list = await database.getIssuesWithinRadius(
                    location.latitude,
                    location.longitude,
                  );
                  print(list.length);
                  print(list);
                },
              ),
              FormWidgets.textButtonTB(
                'Print All issues',
                Colors.white,
                Colors.green,
                onClick: () async {
                  final list = await database.getAllIssues();
                  print(list.length);
                  print(list);
                },
              ),
              FormWidgets.textButtonTB(
                PageName.myComplaints,
                Colors.white,
                Colors.green,
                onClick: () {
                  Navigator.of(context).pushNamed(
                    PageName.myComplaints,
                    arguments: BaseArguments(user: widget.user),
                  );
                },
              ),
              FormWidgets.textButtonTB(
                PageName.profile,
                Colors.white,
                Colors.green,
                onClick: () {
                  Navigator.of(context).pushNamed(
                    PageName.profile,
                    arguments: BaseArguments(user: widget.user),
                  );
                },
              ),
              FormWidgets.textButtonTB(
                PageName.profile,
                Colors.white,
                Colors.green,
                onClick: () {
                  Navigator.of(context).pushNamed(
                    PageName.myComplaints,
                    arguments: BaseArguments(user: widget.user),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
