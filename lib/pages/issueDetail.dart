import 'package:flutter/material.dart';
import '../data/imageDetail.dart';

class Issue extends StatefulWidget {
  final List issueList;
  final int issueNumber;

  Issue(this.issueList, this.issueNumber);

  @override
  State<Issue> createState() => _IssueState();
}

class _IssueState extends State<Issue> {
  Color setStatusColor() {
    if (widget.issueList[widget.issueNumber]['status'] == 'PENDING') {
      return Colors.red;
    } else if (widget.issueList[widget.issueNumber]['status'] ==
        'IN_PROGRESS') {
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Issue ' +
              widget.issueList[widget.issueNumber]['issue_id'].toString(),
        ),
      ),
      body: Container(
        color: Colors.grey[900],
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  IssueImage('image1', 'images/sign1.jpg'),
                  SizedBox(width: 5),
                  IssueImage('image2', 'images/sign2.png'),
                ],
              ),
            ),
            Container(
              height: 40,
              child: Center(
                child: Text(
                  widget.issueList[widget.issueNumber]['status'],
                  style: TextStyle(
                    fontSize: 20,
                    color: setStatusColor(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: Center(
                child: Text(
                  widget.issueList[widget.issueNumber]['address'],
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Tag(
                        Colors.purple[400],
                        widget.issueList[widget.issueNumber]['category_1']
                            .toString()),
                    if (widget.issueList[widget.issueNumber]['category_2'] !=
                        null)
                      Tag(
                          Colors.blueAccent,
                          widget.issueList[widget.issueNumber]['category_2']
                              .toString()),
                    if (widget.issueList[widget.issueNumber]['category_3'] !=
                        null)
                      Tag(
                          Colors.green,
                          widget.issueList[widget.issueNumber]['category_3']
                              .toString()),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Text(
                  widget.issueList[widget.issueNumber]['description'],
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: VoteIcon(Icons.thumb_down, () {setState(() {
                    widget.issueList[widget.issueNumber]['vote']--;
                  });})),
                  Text(
                    widget.issueList[widget.issueNumber]['vote'].toString(),
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  Expanded(child: VoteIcon(Icons.thumb_up, () {setState(() {
                    widget.issueList[widget.issueNumber]['vote']++;
                  });})),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VoteIcon extends StatelessWidget {
  IconData icon;
  void Function()? vote;

  VoteIcon(this.icon, this.vote);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        size: 50,
      ),
      onPressed: vote,
    );
  }
}

class IssueImage extends StatelessWidget {
  String url;
  String tag;

  IssueImage(this.tag, this.url);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImageDetail(tag, url),
              ));
        },
        child: Hero(
            tag: tag,
            child: Image(
              image: AssetImage(url),
              height: 150,
            )));
  }
}

class Tag extends StatelessWidget {
  Color? color;
  String text;

  Tag(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 25,
        width: 50,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
