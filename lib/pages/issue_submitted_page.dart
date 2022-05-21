import 'dart:io';

import 'package:council_reporting/data/db.dart';
import 'package:council_reporting/data/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/geocoding.dart';
import '../data/numbers.dart';
import '../data/strings.dart';
import '../data/widgets.dart';

class IssueSubmittedPage extends StatefulWidget {
  final User user;
  final Issue issue;

  const IssueSubmittedPage({required this.user, required this.issue, Key? key}) : super(key: key);

  @override
  _IssueSubmittedPageState createState() => _IssueSubmittedPageState();
}

class _IssueSubmittedPageState extends State<IssueSubmittedPage> {
  late DeviceDatabase database;

  @override
  void initState() {
    super.initState();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();

    database = Provider.of<DeviceDatabase>(context);
  }

  Future<Widget> _locationInfo(Issue issue) async {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimensions.margin15,
      ),
      child: Column(
        children: [
          await GeoCodingApi().getMap(issue.lat!, issue.long!),
          Text(
            'Coordinates:',
            style: CustomTextStyles.formTextField(Colors.black.value),
          ),
          Text(
            '${issue.lat}, ${issue.long}',
            style: CustomTextStyles.formTextField(Colors.black.value),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormWidgets.iconButtonIB(
                Icons.close,
                50,
                Colors.white,
                Colors.black,
                onClick: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                },
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //#region Status
                    if (widget.issue.status != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${widget.issue.status}',
                                    style: CustomTextStyles.statusTitle(
                                      widget.issue.status == Strings.txtStatusComplete
                                          ? ColourInts.statusCompleted
                                          : widget.issue.status == Strings.txtStatusInProgress
                                              ? ColourInts.statusInProgress
                                              : widget.issue.status == Strings.txtStatusPending
                                                  ? ColourInts.statusPending
                                                  : Colors.black.value,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    //#endregion
                    //#region Map
                    widget.issue.lat != null && widget.issue.long != null
                        ? FutureBuilder(
                            future: _locationInfo(widget.issue),
                            builder: (context, AsyncSnapshot futureSnapshot) {
                              if (futureSnapshot.hasData) {
                                return futureSnapshot.data;
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          )
                        : Container(),
                    //#endregion
                    //#region Category 1
                    if (widget.issue.categoryLvl1 != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.lblCategoryLvl1,
                              style: CustomTextStyles.formTextField(Colors.black.value),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${widget.issue.categoryLvl1}',
                                    style: CustomTextStyles.mainText(
                                      Colors.black.value,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    //#endregion
                    //#region Category 2
                    if (widget.issue.categoryLvl2 != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.lblCategoryLvl2,
                              style: CustomTextStyles.formTextField(Colors.black.value),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${widget.issue.categoryLvl2}',
                                    style: CustomTextStyles.mainText(
                                      Colors.black.value,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    //#endregion
                    //#region Category 3
                    if (widget.issue.categoryLvl3 != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.lblCategoryLvl3,
                              style: CustomTextStyles.formTextField(Colors.black.value),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${widget.issue.categoryLvl3}',
                                    style: CustomTextStyles.mainText(
                                      Colors.black.value,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    //#endregion
                    //#region Description
                    if (widget.issue.description != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.lblDescription,
                              style: CustomTextStyles.formTextField(Colors.black.value),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    '${widget.issue.description}',
                                    style: CustomTextStyles.mainText(
                                      Colors.black.value,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    //#endregion
                    //#region Images
                    FutureBuilder(
                      future: database.getImagesOfIssue(widget.issue.internalIssueId!),
                      builder: (context, AsyncSnapshot<List<Photo>> snapshot) {
                        if (snapshot.hasData &&
                            snapshot.data != null &&
                            snapshot.data!.isNotEmpty) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            Strings.lblImages,
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    File image = File(snapshot.data![index].data);
                                    return Stack(
                                      children: <Widget>[
                                        InkWell(
                                          child: Container(
                                            margin: const EdgeInsets.all(5),
                                            height: 100,
                                            width: 100,
                                            color: Colours.kLightGray,
                                            child: Image.file(image),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              FormWidgets.divider(),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    //#endregion
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
