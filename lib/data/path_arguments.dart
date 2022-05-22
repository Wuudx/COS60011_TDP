import 'package:council_reporting/data/user_registration_info.dart';
import 'package:location/location.dart';

import 'db.dart';

class BaseArguments {
  User? user;

  BaseArguments({
    required this.user,
  });
}

class IssueArguments {
  User user;
  LocationData location;

  IssueArguments({
    required this.user,
    required this.location,
  });
}

class RegisterArguments {
  UserRegistrationInfo userRegistrationInfo;

  RegisterArguments({required this.userRegistrationInfo});
}
