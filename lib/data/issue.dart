import 'package:flutter/material.dart';
import '../pages/issueDetail.dart';

class Issues extends StatelessWidget {
  int issueNumber;
  List issueList;
  Color backgroundColor;

  Issues(this.issueList, this.issueNumber, this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Issue(issueList, issueNumber),
            ));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 10),
        height: 180,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              children: [
                Hero(tag: 'image1', child: IssueListImage('images/sign1.jpg')),
                SizedBox(width: 5),
                Hero(tag: 'image2', child: IssueListImage('images/sign2.png')),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      issueList[issueNumber]['status'].toString(),
                      style: TextStyle(color: setStatusColor()),
                    ),
                    Container(
                      child: Flexible(
                        child: RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            text: TextSpan(
                              text: issueList[issueNumber]['description']
                                  .toString(),
                            )),
                      ),
                      width: 300,
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    issueList[issueNumber]['vote'].toString(),
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color setStatusColor() {
    if (issueList[issueNumber]['status'] == 'PENDING') {
      return Colors.red;
    } else if (issueList[issueNumber]['status'] == 'IN_PROGRESS') {
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }
}

class IssueListImage extends StatelessWidget {
  final String url;

  IssueListImage(this.url);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(url),
      height: 75,
    );
  }
}
