import 'package:council_reporting/data/api_calls.dart';
import 'package:council_reporting/data/db.dart';
import 'package:council_reporting/data/device_info.dart';
import 'package:council_reporting/data/numbers.dart';
import 'package:council_reporting/data/page_navigation.dart';
import 'package:council_reporting/data/path_arguments.dart';
import 'package:council_reporting/data/strings.dart';
import 'package:council_reporting/data/textstyles.dart';
import 'package:council_reporting/data/user_registration_info.dart';
import 'package:council_reporting/data/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final User? user;
  const LoginPage({required this.user, Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loggedIn = false, newUser = false, returningUser = false, clicked = false;
  String firstName = '', lastName = '', mobile = '';

  @override
  void initState() {
    super.initState();
    loggedIn = widget.user != null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _canContinue() =>
      mobile.contains(RegExp(r"^04[0-9]{8}$")) &&
      (!newUser ||
          (newUser &&
              firstName.contains(RegExp(r"^([A-ZÀ-ÿ][-,a-z. ']+[ ]*)+$")) &&
              lastName.contains(RegExp(r"^([A-ZÀ-ÿ][-,a-z. ']+[ ]*)+$"))));

  Widget _interactionButtons() => Column(
        children: [
          //#region Logged in
          if (loggedIn && !newUser && !returningUser)
            FormWidgets.textButtonTB(
              widget.user!.firstName,
              Colors.black,
              Colors.white,
              onClick: () async {
                User? userDetails = await Api().getUser(widget.user!.mobile);

                if (userDetails != null) {
                  final db = Provider.of<DeviceDatabase>(context, listen: false);
                  await db.updateUserInfo(userDetails);
                } else {
                  userDetails = widget.user;
                }
                Navigator.of(context).pushNamedAndRemoveUntil(
                  PageName.map,
                  (route) => false,
                  arguments: BaseArguments(user: userDetails),
                );
              },
            ),
          //#endregion
          //#region Log Out
          if (loggedIn && !newUser && !returningUser)
            FormWidgets.textButtonTB(
              Strings.btnLogOut,
              Colors.black,
              Colors.white,
              onClick: () {
                setState(() {
                  loggedIn = false;
                });
              },
            ),
          //#endregion
          //#region Log In
          if (!loggedIn && !newUser && !returningUser)
            FormWidgets.textButtonTB(
              Strings.btnLogIn,
              Colors.black,
              Colors.white,
              onClick: () {
                setState(() {
                  returningUser = true;
                });
              },
            ),
          //#endregion
          //#region Register
          if (!newUser && !returningUser)
            FormWidgets.textButtonTB(
              Strings.btnRegister,
              Colors.black,
              Colors.white,
              onClick: () {
                setState(() {
                  newUser = true;
                });
              },
            ),
          //#endregion
          //#region Back
          if (newUser || returningUser)
            FormWidgets.textButtonTB(
              Strings.btnBack,
              Colors.white,
              Colors.red,
              onClick: () {
                FocusScope.of(context).unfocus();
                setState(() {
                  firstName = '';
                  lastName = '';
                  mobile = '';
                  newUser = returningUser = clicked = false;
                });
              },
            ),
          //#endregion
        ],
      );

  Widget _form() => SizedBox(
        width: MediaQuery.of(context).size.shortestSide * 0.8,
        child: Column(
          children: [
            if (newUser)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Dimensions.margin15,
                ),
                child: FormWidgets.nameTextField(
                  Colors.black,
                  onChange: (value) {
                    setState(() {
                      firstName = value;
                    });
                  },
                  capitalisation: TextCapitalization.words,
                  hintText: Strings.hntFirstName,
                  filled: true,
                  backgroundColour: Colors.white,
                ),
              ),
            if (newUser)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Dimensions.margin15,
                ),
                child: FormWidgets.nameTextField(
                  Colors.black,
                  onChange: (value) {
                    setState(() {
                      lastName = value;
                    });
                  },
                  capitalisation: TextCapitalization.words,
                  hintText: Strings.hntLastName,
                  filled: true,
                  backgroundColour: Colors.white,
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Dimensions.margin15,
              ),
              child: FormWidgets.mobileTextField(
                Colors.black,
                onChange: (value) {
                  setState(() {
                    mobile = value;
                  });
                },
                maxLength: 10,
                hintText: Strings.hntMobile,
                filled: true,
                backgroundColour: Colors.white,
              ),
            ),
            if (_canContinue())
              FormWidgets.textButtonTB(
                Strings.btnContinue,
                Colors.white,
                Colors.green,
                onClick: () async {
                  FocusScope.of(context).unfocus();
                  if (clicked) {
                    return;
                  }
                  setState(() {
                    clicked = true;
                  });
                  UserRegistrationInfo userRegistrationInfo = UserRegistrationInfo(
                    mobile: mobile,
                    firstName: firstName != '' ? firstName : null,
                    lastName: lastName != '' ? lastName : null,
                    deviceId: await DevicePlatform.getDeviceId(),
                  );
                  bool userExists = false;
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => Dialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                      elevation: 0.0,
                      backgroundColor: Colors.transparent,
                      child: Container(
                        margin: const EdgeInsets.only(left: 0.0, right: 0.0),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.only(
                              top: Dimensions.margin15,
                              left: Dimensions.margin15,
                              right: Dimensions.margin15,
                              bottom: Dimensions.margin15,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(Dimensions.radius10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 0.0,
                                    offset: Offset(0.0, 0.0),
                                  ),
                                ]),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: Dimensions.margin15),
                                    child: Text(
                                      Strings.popCheckingNumber,
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyles.popupText(Colors.black.value),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                  userExists = await Api().userExist(mobile);

                  if (!userExists && firstName == '') {
                    Navigator.of(context, rootNavigator: true).pop();
                    setState(() {
                      clicked = false;
                    });
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) => Dialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                        elevation: 0.0,
                        backgroundColor: Colors.transparent,
                        child: Container(
                          margin: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    top: Dimensions.margin15,
                                    left: Dimensions.margin15,
                                    right: Dimensions.margin15,
                                    bottom: Dimensions.margin15,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 0.0,
                                          offset: Offset(0.0, 0.0),
                                        ),
                                      ]),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        const Icon(
                                          Icons.error_outline,
                                          size: 100,
                                          color: Colors.red,
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: Dimensions.margin15,
                                            ),
                                            child: Text(
                                              Strings.popMobileExist,
                                              textAlign: TextAlign.center,
                                              style: CustomTextStyles.popupText(
                                                Colors.black.value,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 24.0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: FormWidgets.textButtonTB(
                                      Strings.btnClose,
                                      Colors.white,
                                      Colors.red,
                                      onClick: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (userExists && firstName == '' || !userExists && firstName != '') {
                    await Api().requestOtp(mobile, userRegistrationInfo.deviceId);
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.of(context).pushNamed(
                      PageName.otp,
                      arguments: RegisterArguments(userRegistrationInfo: userRegistrationInfo),
                    );
                  } else {
                    Navigator.of(context, rootNavigator: true).pop();
                    setState(() {
                      clicked = false;
                    });
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (_) => Dialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                        elevation: 0.0,
                        backgroundColor: Colors.transparent,
                        child: Container(
                          margin: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    top: Dimensions.margin15,
                                    left: Dimensions.margin15,
                                    right: Dimensions.margin15,
                                    bottom: Dimensions.margin15,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 0.0,
                                          offset: Offset(0.0, 0.0),
                                        ),
                                      ]),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        const Icon(
                                          Icons.error_outline,
                                          size: 100,
                                          color: Colors.red,
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: Dimensions.margin15,
                                            ),
                                            child: Text(
                                              Strings.popMobileNotExist,
                                              textAlign: TextAlign.center,
                                              style: CustomTextStyles.popupText(
                                                Colors.black.value,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 24.0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: FormWidgets.textButtonTB(
                                      Strings.btnClose,
                                      Colors.white,
                                      Colors.red,
                                      onClick: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.ttlWelcome,
                style: CustomTextStyles.loginTitle(Colors.white.value),
              ),
              if (newUser || returningUser) _form(),
              _interactionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
