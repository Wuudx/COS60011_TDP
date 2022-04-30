import 'package:council_reporting/data/db.dart';
import 'package:council_reporting/data/strings.dart';
import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  final User? user;

  const MapPage({required this.user, Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late User? _user;

  @override
  void initState() {
    super.initState();
    _user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.txtNotImplemented,
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
