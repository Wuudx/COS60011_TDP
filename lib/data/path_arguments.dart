import 'package:council_reporting/data/user_registration_info.dart';
import 'package:location/location.dart';

import 'db.dart';

class BaseArguments {
  User? user;
  LocationData? location;

  BaseArguments({
    required this.user,
    this.location,
  });
}

class RegisterArguments {
  UserRegistrationInfo userRegistrationInfo;

  RegisterArguments({required this.userRegistrationInfo});
}
