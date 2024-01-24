import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.onClick,
    super.key,
  });
  final String text;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.kPrimaryColor),
      child: MaterialButton(
        onPressed: onClick,
        child: Text(text, style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
