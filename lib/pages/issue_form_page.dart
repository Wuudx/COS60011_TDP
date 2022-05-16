import 'package:council_reporting/data/db.dart';
import 'package:council_reporting/data/textstyles.dart';
import 'package:council_reporting/pages/issue_form_section.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../data/geocoding.dart';
import '../data/numbers.dart';

class IssueFormPage extends StatelessWidget {
  final User? user;
  final LocationData? location;

  const IssueFormPage({required this.user, this.location, Key? key}) : super(key: key);

  Future<Widget> _locationInfo(LocationData position) async {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimensions.margin15,
      ),
      child: Column(
        children: [
          await GeoCodingApi().getMap(position.latitude!, position.longitude!),
          Text(
            'Coordinates:',
            style: CustomTextStyles.formTextField(Colors.black.value),
          ),
          Text(
            '${position.latitude}, ${position.longitude}',
            style: CustomTextStyles.formTextField(Colors.black.value),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    location != null
                        ? FutureBuilder(
                            future: _locationInfo(location!),
                            builder: (context, AsyncSnapshot futureSnapshot) {
                              if (futureSnapshot.hasData) {
                                return futureSnapshot.data;
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          )
                        : Container(),
                    IssueFormSection(
                      user: user,
                      location: location,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
