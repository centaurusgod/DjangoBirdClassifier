import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:birds_classification/constants/color_constants.dart';
import 'package:birds_classification/theme/textstyle.dart';

class Themes {
  static ThemeData light(BuildContext context) {
    return ThemeData.light().copyWith(
      iconTheme: const IconThemeData(color: Colors.black),
      primaryColor: ColorConstants.kPrimaryColor,
      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorConstants.kPrimaryColor.withOpacity(0.5)),
      navigationBarTheme: NavigationBarThemeData(labelTextStyle:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return GoogleFonts.urbanist(
              fontSize: 15, fontWeight: FontWeight.w600);
        } else {
          return GoogleFonts.urbanist(
              fontSize: 13, fontWeight: FontWeight.w500);
        }
      })),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
      ),

      // Use GoogleFonts widget to set the font family
      textTheme: GoogleFonts.urbanistTextTheme(
        Theme.of(context).textTheme.copyWith(
            titleLarge: AppTextStyles.titleLarge
                .copyWith(color: ColorConstants.kPlaneWhiteColor),
            titleMedium: AppTextStyles.titleMedium
                .copyWith(color: ColorConstants.KtextColor),
            labelMedium: AppTextStyles.inputHintLabel
                .copyWith(color: ColorConstants.KInputLabelColor),
            titleSmall: AppTextStyles.titleSmall),
      ),
    );
  }
}
