import 'package:connectivity/connectivity.dart';
import 'package:council_reporting/data/db.dart';
import 'package:council_reporting/data/page_navigation.dart';
import 'package:council_reporting/data/strings.dart';
import 'package:council_reporting/data/user_registration_info.dart';
import 'package:council_reporting/data/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../data/api_calls.dart';
import '../data/numbers.dart';
import '../data/textstyles.dart';

class OtpPage extends StatefulWidget {
  final UserRegistrationInfo userRegistrationInfo;
  const OtpPage({required this.userRegistrationInfo, Key? key}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController code = TextEditingController();
  String? otp;
  final GlobalKey<State> _stateKey = GlobalKey<State>();
  Api api = Api();

  @override
  void initState() {
    super.initState();
    code.addListener(textChanges);
  }

  textChanges() {
    setState(() {
      otp = code.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      key: _stateKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: Dimensions.margin15,
            right: Dimensions.margin15,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Strings.ttlEnterOtp,
                  style: CustomTextStyles.loginTitle(Colors.white.value),
                ),
                PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.none,
                  autoFocus: true,
                  textStyle: CustomTextStyles.formTextField(Colors.black.value),
                  cursorColor: Colors.black,
                  backgroundColor: Colors.blueGrey,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldHeight: 80,
                    fieldWidth: 60,
                    inactiveColor: Colors.white,
                    activeFillColor: Colors.white,
                    activeColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedColor: Colors.black,
                    selectedFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: code,
                  onCompleted: (v) async {
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
                                        Strings.popCheckingCode,
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
                    var connectivityResult = await Connectivity().checkConnectivity();
                    if (connectivityResult != ConnectivityResult.none) {
                      final bool outputIfValidOTP =
                          await api.validateOtp(widget.userRegistrationInfo.mobile, otp!);
                      if (outputIfValidOTP) {
                        Navigator.of(context, rootNavigator: true).pop();
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => Dialog(
                            shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
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
                                            Strings.popGettingInfo,
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
                        User? userDetails = await api.submitUserInfo(widget.userRegistrationInfo);
                        if (userDetails != null) {
                          final db = Provider.of<DeviceDatabase>(context, listen: false);
                          await db.updateUserInfo(userDetails);
                          // Navigator.of(context).pop();
                          // TODO: Change navigation to correct route
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            PageName.testPages,
                            (route) => false,
                          );
                        }
                      } else {
                        Navigator.of(context, rootNavigator: true).pop();
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (_) => Dialog(
                            shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
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
                                        ],
                                      ),
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
                                                  Strings.popOtpNotValid,
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
                        code.text = '';
                      }
                    } else {
                      Navigator.of(context, rootNavigator: true).pop();
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
                                                Strings.popNoInternetDetected,
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
                    // });
                  },
                  onChanged: (value) {
                    setState(() {
                      otp = value;
                    });
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  autoDisposeControllers: false,
                  appContext: context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
