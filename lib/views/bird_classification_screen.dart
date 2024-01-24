import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:birds_classification/config/ext.dart';
import 'package:birds_classification/constants/color_constants.dart';
import 'package:birds_classification/controllers/object_detection_screen_controller.dart';
import 'package:birds_classification/widgets/custom_elevated_button.dart';
import 'package:birds_classification/widgets/image_button_sheet.dart';

class BirdClassificationScreen extends StatelessWidget {
  final BirdClassificationController objectDetectionScreenController =
      Get.put(BirdClassificationController());

  BirdClassificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bird Classification',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ColorConstants.KtextColor,
              ),
        ),
      ),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Obx(() {
              // Observe changes in the controller
              return objectDetectionScreenController.filePath.value != ''
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.memory(
                          objectDetectionScreenController.pickedImage.value!,
                          height: 250.h,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 100.w, vertical: 100.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Upload Image',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return AddImageBottomSheet(
                                    onPressedGallery: () {
                                      objectDetectionScreenController
                                          .pickImageFromGallery();
                                    },
                                    onPressedCamera: () {
                                      objectDetectionScreenController
                                          .pickImageFromCamera();
                                    },
                                  );
                                },
                              );
                            },
                            buttonText: 'Choose Image',
                          )
                        ],
                      ),
                    );
            }),
          ),
          SizedBox(
            height: 20.h,
          ),
          Obx(() => Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        objectDetectionScreenController.filePath.value != ''
                            ? CustomElevatedButton(
                                isApiCall: false,
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return AddImageBottomSheet(
                                        onPressedGallery: () {
                                          objectDetectionScreenController
                                              .pickImageFromGallery();
                                        },
                                        onPressedCamera: () {
                                          objectDetectionScreenController
                                              .pickImageFromCamera();
                                        },
                                      );
                                    },
                                  );
                                },
                                buttonText: 'Change Image')
                            : const SizedBox(),
                        SizedBox(
                          width: 25.w,
                        ),
                        objectDetectionScreenController.isLoading.value == true
                            ? SizedBox(
                                height: 30.h,
                                width: 32.w,
                                child: const CircularProgressIndicator(
                                    color: ColorConstants.kPrimaryColor,
                                    strokeWidth: 3))
                            : CustomElevatedButton(
                                onPressed: objectDetectionScreenController
                                                .filePath.value !=
                                            '' &&
                                        objectDetectionScreenController
                                                .pickedImage.value !=
                                            null
                                    ? () {
                                        objectDetectionScreenController
                                            .detectImage();
                                      }
                                    : () {},
                                buttonText: 'Detect')
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
