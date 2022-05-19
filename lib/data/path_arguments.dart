import 'package:council_reporting/data/user_registration_info.dart';

import 'db.dart';

class BaseArguments {
  User? user;

  BaseArguments({
    required this.user,
  });
}

class RegisterArguments{
  UserRegistrationInfo userRegistrationInfo;

  RegisterArguments({required this.userRegistrationInfo});
}
