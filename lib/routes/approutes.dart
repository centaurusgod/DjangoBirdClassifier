import 'package:get/get.dart';
import 'package:birds_classification/views/bird_classification_screen.dart';

import '../views/classification_result-screen.dart';

class AppRoutes {
  static const String intial = '/';
  static const String classificationResult = '/classificationResult';
  static final List<GetPage> routes = [
    GetPage(
      name: intial,
      page: () => BirdClassificationScreen(),
    ),
    GetPage(
      name: classificationResult,
      page: () => ClassificationResultScreen(),
    ),
  ];
}
