import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../pages/complaintListPage.dart';


class LoadingPage extends StatefulWidget {
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    getIssues();
    super.initState();
  }
  void getIssues() async {
    Response response = await get(Uri.parse(
        'http://ec2-54-206-191-64.ap-southeast-2.compute.amazonaws.com/api/issue'));
    var issueList = jsonDecode(response.body);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ComplaintListPage(issueList);
    }));
  }

  @override
  Widget build(BuildContext context) {

    return Container(
    );
  }
}


