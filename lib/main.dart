import 'package:council_reporting/data/db.dart';
import 'package:council_reporting/data/path_arguments.dart';
import 'package:flutter/material.dart';
import 'package:council_reporting/data/page_navigation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import 'data/api_calls.dart';
import 'data/numbers.dart';
import 'data/strings.dart';
import 'data/textstyles.dart';

void main() {
  runApp(
    Provider<DeviceDatabase>(
      create: (context) => DeviceDatabase(),
      child: const MyApp(),
      dispose: (context, db) => db.close(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: PageName.home,
      onGenerateRoute: PageRoutes.generateRoute,
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  _nextPage(
    BuildContext context,
    User? user,
  ) async {
    Navigator.of(context).pushReplacementNamed(
      PageName.login,
      arguments: BaseArguments(
        user: user,
      ),
    );
  }

  _toRoute(BuildContext context) {
    final db = Provider.of<DeviceDatabase>(context, listen: false);
    db.getUser().then((user) async {
      Api api = Api();
      final issues = await api.getIssues();
      if (issues != null) {
        await db.updateIssues(issues);
      }
      final categories = await api.getCategories();
      if (categories != null) {
        await db.updateCategories(categories);
      }
      _nextPage(context, user);
    });
  }

  @override
  Widget build(BuildContext context) {
    _toRoute(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Column(
                children: [
                  Text(
                    Strings.appCouncilReportingTool,
                    style: CustomTextStyles.appTitle(Colors.black.value),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: Dimensions.margin5),
                    child: Text(
                      Strings.appCreatedBy,
                      style: CustomTextStyles.createdByText(Colours.kLightGray.value),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    Strings.appTeam,
                    style: CustomTextStyles.appTeam(Colors.black.value),
                    textAlign: TextAlign.center,
                  ),
                  FutureBuilder(
                    future: PackageInfo.fromPlatform(),
                    builder: (context, AsyncSnapshot futureSnapshot) {
                      if (futureSnapshot.hasData) {
                        return Text(
                          '\n${Strings.txtVersion}${futureSnapshot.data.version}',
                          style: CustomTextStyles.smallLabelText(Colours.kLightGray.value),
                        );
                      } else {
                        return Container();
                      }
                    },
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
