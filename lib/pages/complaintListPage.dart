import 'package:flutter/material.dart';
import '../data/issue.dart';
import '../data/constants.dart';

class ComplaintListPage extends StatelessWidget {
  dynamic issueList;

  ComplaintListPage(this.issueList);

  int setColor(i) {
    while (i > 3) {
      i -= 4;
    }
    return i;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complain List'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: ListView(
        children: [
          for (int i = 0; i < issueList.length; i++)
            Issues(issueList, i, kBackgroundColors[setColor(i)])
        ],
      ),
    );
  }
}
