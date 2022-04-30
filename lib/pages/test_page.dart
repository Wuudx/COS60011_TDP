import 'package:council_reporting/data/page_navigation.dart';
import 'package:council_reporting/data/path_arguments.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      PageName.login,
                      arguments: BaseArguments(
                        user: null,
                      ),
                    );
                  },
                  child: Text(
                    PageName.login,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const Divider(
                  thickness: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      PageName.otp,
                      arguments: BaseArguments(
                        user: null,
                      ),
                    );
                  },
                  child: Text(
                    PageName.otp,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const Divider(
                  thickness: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      PageName.profile,
                      arguments: BaseArguments(
                        user: null,
                      ),
                    );
                  },
                  child: Text(
                    PageName.profile,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const Divider(
                  thickness: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      PageName.map,
                      arguments: BaseArguments(
                        user: null,
                      ),
                    );
                  },
                  child: Text(
                    PageName.map,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const Divider(
                  thickness: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      PageName.complaint,
                      arguments: BaseArguments(
                        user: null,
                      ),
                    );
                  },
                  child: Text(
                    PageName.complaint,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const Divider(
                  thickness: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      PageName.myComplaints,
                      arguments: BaseArguments(
                        user: null,
                      ),
                    );
                  },
                  child: Text(
                    PageName.myComplaints,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
