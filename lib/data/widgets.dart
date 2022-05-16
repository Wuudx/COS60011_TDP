import 'package:council_reporting/data/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'numbers.dart';

class FormWidgets {

  static divider() => const Divider(
    color: Colors.black,
    thickness: 1.0,
    height: 5.0,
  );
  Widget textButtonGD(
    String text,
    Color textColour,
    Color buttonColour, {
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    VoidCallback? onLongPress,
  }) =>
      GestureDetector(
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        child: Container(
          height: Dimensions.btnHeight60,
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.margin15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(Dimensions.radius10),
            ),
            color: buttonColour,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: CustomTextStyles.buttonText(textColour.value),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
  Widget iconButtonGD(
    IconData icon,
    double size,
    Color buttonColour,
    Color iconColour, {
    VoidCallback? onTap,
    VoidCallback? onDoubleTap,
    VoidCallback? onLongPress,
  }) =>
      GestureDetector(
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        child: Container(
          height: Dimensions.btnHeight60,
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.margin15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(Dimensions.radius10),
            ),
            color: buttonColour,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: size,
                color: iconColour,
              ),
            ],
          ),
        ),
      );

  static Widget textButtonTB(
    String text,
    Color textColour,
    Color buttonColour, {
    VoidCallback? onClick,
    VoidCallback? onLongPressed,
  }) =>
      ButtonTheme(
        height: Dimensions.btnHeight60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius10),
        ),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonColour),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) return Colors.black;
                if (states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed)) {
                  return Colors.black12;
                }
                return null; // Defer to the widget's default.
              },
            ),
          ),
          child: Text(
            text,
            style: CustomTextStyles.buttonText(textColour.value),
          ),
          onPressed: onClick,
          onLongPress: onLongPressed,
        ),
      );

  static Widget iconButtonIB(
    IconData icon,
    double size,
    Color buttonColour,
    Color iconColour, {
    VoidCallback? onClick,
  }) =>
      IconButton(
        onPressed: onClick,
        icon: Icon(
          icon,
          size: size,
          color: iconColour,
        ),
        color: buttonColour,
        splashColor: Colors.black12,
      );

  static Widget _textField(
    Color textColour, {
    void Function(String)? onChange,
    TextEditingController? controller,
    int? maxLength,
    bool autoFocus = false,
    TextCapitalization capitalisation = TextCapitalization.none,
    String? hintText,
    String counterText = '',
    InputBorder border = InputBorder.none,
    TextInputType? inputType,
    List<TextInputFormatter>? inputFormatters,
  }) =>
      TextField(
        onChanged: onChange,
        controller: controller,
        maxLines: null,
        maxLength: maxLength,
        autofocus: autoFocus,
        textCapitalization: capitalisation,
        decoration: InputDecoration(
          hintText: hintText,
          counterText: counterText,
          border: border,
        ),
        style: CustomTextStyles.formTextField(textColour.value),
        keyboardType: inputType,
        inputFormatters: inputFormatters,
      );

  static Widget posNumberTextField(
    Color textColour, {
    void Function(String)? onChange,
    TextEditingController? controller,
    int? maxLength,
    bool autoFocus = false,
    TextCapitalization capitalisation = TextCapitalization.none,
    String? hintText,
    String counterText = '',
    List<TextInputFormatter>? inputFormatters,
  }) =>
      _textField(
        textColour,
        onChange: onChange,
        controller: controller,
        maxLength: maxLength,
        autoFocus: autoFocus,
        capitalisation: capitalisation,
        hintText: hintText,
        counterText: counterText,
        inputType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      );

  static Widget anyNumberTextField(
    Color textColour, {
    void Function(String)? onChange,
    TextEditingController? controller,
    int? maxLength,
    bool autoFocus = false,
    TextCapitalization capitalisation = TextCapitalization.none,
    String? hintText,
    String counterText = '',
  }) =>
      _textField(
        textColour,
        onChange: onChange,
        controller: controller,
        maxLength: maxLength,
        autoFocus: autoFocus,
        capitalisation: capitalisation,
        hintText: hintText,
        counterText: counterText,
        inputType: TextInputType.number, // numberWithOptions may throw error on iOS
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(r'^-?[1-9]*[0-9]?'),
          ),
        ],
      );

  static Widget decimalTextField(
    Color textColour, {
    void Function(String)? onChange,
    TextEditingController? controller,
    int? maxLength,
    bool autoFocus = false,
    TextCapitalization capitalisation = TextCapitalization.none,
    String? hintText,
    String counterText = '',
  }) =>
      _textField(
        textColour,
        onChange: onChange,
        controller: controller,
        maxLength: maxLength,
        autoFocus: autoFocus,
        capitalisation: capitalisation,
        hintText: hintText,
        counterText: counterText,
        inputType: TextInputType.number, // numberWithOptions may throw error on iOS
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(r'^(\d+){1,15}(\.\d{0,4})?'),
          ),
        ],
      );

  static Widget mobileTextField(
    Color textColour, {
    void Function(String)? onChange,
    TextEditingController? controller,
    int? maxLength,
    bool autoFocus = false,
    TextCapitalization capitalisation = TextCapitalization.none,
    String? hintText,
    String counterText = '',
  }) =>
      _textField(
        textColour,
        onChange: onChange,
        controller: controller,
        maxLength: maxLength,
        autoFocus: autoFocus,
        capitalisation: capitalisation,
        hintText: hintText,
        counterText: counterText,
        inputType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
      );

  static Widget emailTextField(
    Color textColour, {
    void Function(String)? onChange,
    TextEditingController? controller,
    int? maxLength,
    bool autoFocus = false,
    TextCapitalization capitalisation = TextCapitalization.none,
    String? hintText,
    String counterText = '',
  }) =>
      _textField(
        textColour,
        onChange: onChange,
        controller: controller,
        maxLength: maxLength,
        autoFocus: autoFocus,
        capitalisation: capitalisation,
        hintText: hintText,
        counterText: counterText,
        inputType: TextInputType.emailAddress,
      );

  static Widget nameTextField(
    Color textColour, {
    void Function(String)? onChange,
    TextEditingController? controller,
    int? maxLength,
    bool autoFocus = false,
    TextCapitalization capitalisation = TextCapitalization.none,
    String? hintText,
    String counterText = '',
  }) =>
      _textField(
        textColour,
        onChange: onChange,
        controller: controller,
        maxLength: maxLength,
        autoFocus: autoFocus,
        capitalisation: capitalisation,
        hintText: hintText,
        counterText: counterText,
        inputType: TextInputType.name,
      );
}
