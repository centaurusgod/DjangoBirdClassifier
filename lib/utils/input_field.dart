import 'package:flutter/material.dart';
import 'package:birds_classification/constants/color_constants.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.errorText,
    required this.hintText,
    required this.keywordType,
    required this.validation,
    required this.obscureText,
    this.controller,
    required this.isPrefix,
    this.suffix,
    this.prefixIcon,
    required this.readonly,
    required this.onChanged,
  }) : super(key: key);

  final String? errorText;
  final String? hintText;
  final Function(String?) validation;
  final Function(String?) onChanged; // Make onChanged optional
  final TextEditingController? controller;
  final TextInputType keywordType;
  final bool obscureText;
  final bool isPrefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final bool readonly;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    // Set initial value if provided
    return TextFormField(
      onChanged: (value) => onChanged(value),
      readOnly: readonly,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keywordType,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelStyle: Theme.of(context).textTheme.labelMedium,
        prefixIcon: prefixIcon,
        errorText: errorText,
        filled: false,
        contentPadding: EdgeInsets.only(
          bottom: deviceHeight * 0.018,
          top: deviceHeight * 0.015,
        ),
        prefix: isPrefix
            ? const Padding(padding: EdgeInsets.zero)
            : Padding(padding: EdgeInsets.only(left: deviceWidth * 0.04)),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 0.5, color: ColorConstants.kPrimaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 0.5, color: ColorConstants.kPrimaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 0.5, color: ColorConstants.KErrorColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 0.5, color: ColorConstants.KErrorColor),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelMedium,
        suffixIcon: suffix,
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.8,
            color: Color.fromRGBO(0, 0, 0, 0.15),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        errorMaxLines: 3,
      ),
      validator: (value) => validation(value),
    );
  }
}
