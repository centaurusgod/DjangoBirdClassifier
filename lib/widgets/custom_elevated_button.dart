import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.isApiCall = true,
  });

  final VoidCallback onPressed;
  final String buttonText;
  final bool isApiCall;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: isApiCall
                ? MaterialStateProperty.all<Color>(
                    Theme.of(context).colorScheme.primaryContainer)
                : MaterialStateProperty.all<Color>(
                    Colors.transparent) // Set the background color
            ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Theme.of(context).colorScheme.onBackground),
        ));
  }
}
