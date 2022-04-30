import 'package:council_reporting/data/db.dart';
import 'package:council_reporting/data/strings.dart';
import 'package:flutter/material.dart';

class IssueFormPage extends StatefulWidget {
  final User? user;

  const IssueFormPage({required this.user, Key? key}) : super(key: key);

  @override
  _IssueFormPageState createState() => _IssueFormPageState();
}

class _IssueFormPageState extends State<IssueFormPage> {
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
