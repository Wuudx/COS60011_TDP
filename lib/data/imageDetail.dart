import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  String url;
  String tag;
  ImageDetail(this.tag, this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(child: Hero(tag: tag, child: IssueImage(url))),
      ),
    );
  }
}


class IssueImage extends StatelessWidget {
  final String url;

  IssueImage(this.url);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(url),
    );
  }
}