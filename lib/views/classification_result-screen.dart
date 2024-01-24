import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:birds_classification/config/ext.dart';

import '../constants/color_constants.dart';
import '../controllers/object_detection_screen_controller.dart';

class ClassificationResultScreen extends StatelessWidget {
  final BirdClassificationController birdClassificationController =
      Get.put(BirdClassificationController());
  ClassificationResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Classification Result',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ColorConstants.KtextColor,
              ),
        ),
      ),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Row(children: [
              Image.memory(
                birdClassificationController.pickedImage.value!,
                height: 250.h,
                width: 200.w,
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RowBuilder(
                        keyS: "Status Code",
                        value:
                            birdClassificationController.bird.value.statusCode),
                    SizedBox(
                      height: 10.h,
                    ),
                    RowBuilder(
                        keyS: "Current Status",
                        value:
                            birdClassificationController.bird.value.statusName),
                    SizedBox(
                      height: 10.h,
                    ),
                    RowBuilder(
                        keyS: "Common Name",
                        value:
                            birdClassificationController.bird.value.commonName),
                    SizedBox(
                      height: 10.h,
                    ),
                    RowBuilder(
                        keyS: "Scientific Name",
                        value: birdClassificationController
                            .bird.value.scientificName)
                  ],
                ),
              ),
            ]),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Text(
                birdClassificationController.bird.value.birdDescription,
                textAlign: TextAlign.justify,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RowBuilder extends StatelessWidget {
  const RowBuilder({super.key, required this.keyS, required this.value});
  final String keyS;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$keyS"),
        SizedBox(
          height: 5.h,
        ),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold),
          maxLines: 2,
        )
      ],
    );
  }
}
