import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:birds_classification/config/app_config.dart';
import 'package:birds_classification/routes/approutes.dart';
import 'package:birds_classification/theme/themes.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        AppConfig(
          designScreenWidth: 392,
          designScreenHeight: 781,
        ).init(context, constraints, orientation);

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bird Classification',
          theme: Themes.light(context),
          initialRoute: AppRoutes.intial,
          getPages: AppRoutes.routes,
        );
      });
    });
  }
}
