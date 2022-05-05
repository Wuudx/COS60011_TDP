import 'package:council_reporting/data/db.dart';
import 'package:council_reporting/data/strings.dart';
import 'package:council_reporting/data/widgets.dart';
import 'package:flutter/material.dart';

class IssueFormPage extends StatefulWidget {
  final User? user;

  const IssueFormPage({required this.user, Key? key}) : super(key: key);

  @override
  _IssueFormPageState createState() => _IssueFormPageState();
}

class _IssueFormPageState extends State<IssueFormPage> {
  late User? _user;
  TextEditingController category1 = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController location = TextEditingController();

  @override
  void initState() {
    super.initState();
    _user = widget.user;
  }

  @override
  void dispose() {
    super.dispose();
    category1.dispose();
    description.dispose();
    location.dispose();
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
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  Strings.lblLocation,
                                  style: TextStyle(fontSize: 30),
                                ),
                                FormWidgets.nameTextField(
                                  Colors.black,
                                  controller: location,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  Strings.lblCategoryLvl1,
                                  style: TextStyle(fontSize: 30),
                                ),
                                FormWidgets.nameTextField(
                                  Colors.black,
                                  controller: category1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  Strings.lblDescription,
                                  style: TextStyle(fontSize: 30),
                                ),
                                FormWidgets.nameTextField(
                                  Colors.black,
                                  controller: description,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FormWidgets.textButtonTB(
                Strings.btnSubmit,
                Colors.white,
                Colors.green,
                onClick: () => {print('submitted')},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
