import 'package:council_reporting/data/path_arguments.dart';
import 'package:council_reporting/main.dart';
import 'package:council_reporting/pages/complaint_list_page.dart';
import 'package:council_reporting/pages/issue_form_page.dart';
import 'package:council_reporting/pages/login_page.dart';
import 'package:council_reporting/pages/map_page.dart';
import 'package:council_reporting/pages/otp_page.dart';
import 'package:council_reporting/pages/profile_page.dart';
import 'package:council_reporting/pages/test_page.dart';
import 'package:flutter/material.dart';

class PageName {
  static const complaint = '/complaint';
  static const home = '/';
  static const login = '/login';
  static const map = '/map';
  static const myComplaints = '/my_complaints';
  static const otp = '/otp';
  static const profile = '/profile';

  static const testPages = 'test_pages';
}

class PageRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageName.home:
        return PageRouteBuilder(
          pageBuilder: (_, a1, a2) => const LandingPage(),
        );

      case PageName.login:
        BaseArguments baseArgs = settings.arguments as BaseArguments;
        return PageRouteBuilder(
          pageBuilder: (_, a1, a2) => LoginPage(
            user: baseArgs.user,
          ),
        );

      case PageName.otp:
        RegisterArguments regArgs = settings.arguments as RegisterArguments;
        return PageRouteBuilder(
          pageBuilder: (_, a1, a2) => OtpPage(
            userRegistrationInfo: regArgs.userRegistrationInfo,
          ),
        );

      case PageName.profile:
        BaseArguments baseArgs = settings.arguments as BaseArguments;
        return PageRouteBuilder(
          pageBuilder: (_, a1, a2) => ProfilePage(
            user: baseArgs.user,
          ),
        );

      case PageName.map:
        BaseArguments baseArgs = settings.arguments as BaseArguments;
        return PageRouteBuilder(
          pageBuilder: (_, a1, a2) => MapPage(
            user: baseArgs.user,
          ),
        );

      case PageName.complaint:
        BaseArguments baseArgs = settings.arguments as BaseArguments;
        return PageRouteBuilder(
          pageBuilder: (_, a1, a2) => IssueFormPage(
            user: baseArgs.user,
          ),
        );

      case PageName.myComplaints:
        BaseArguments baseArgs = settings.arguments as BaseArguments;
        return PageRouteBuilder(
          pageBuilder: (_, a1, a2) => ComplaintListPage(
            user: baseArgs.user,
          ),
        );

      case PageName.testPages:
        return PageRouteBuilder(
          pageBuilder: (_, a1, a2) => TestPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
