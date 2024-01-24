import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:birds_classification/helpers/image_picker.dart';
import 'package:birds_classification/models/bird_classification.dart';
import 'package:birds_classification/routes/approutes.dart';
import 'package:birds_classification/services/apihandler.dart';
import 'package:http/http.dart' as http;

class BirdClassificationController extends GetxController {
  Rx<Uint8List?> pickedImage = Rx<Uint8List?>(Uint8List(0));
  Rx<String?> filePath = Rx<String?>('');
  Rx<String?> detectedImageClass = Rx<String?>('');
  RxBool isLoading = false.obs;
  Rx<List<dynamic>?> detectionResult = Rx<List<dynamic>?>([]);
  Rx<String?> detectedImageUrl = Rx<String?>('');
  Rx<BirdClassification> bird = BirdClassification(
    statusCode: "",
    commonName: "",
    statusName: "",
    scientificName: "",
    birdDescription: "",
  ).obs;
  Future<void> pickImageFromCamera() async {
    final imageProcessor = ImageProcessor();

    ImagePick? result = await imageProcessor.pickImage(ImageSource.camera);
    if (result != null) {
      Get.back();
      pickedImage.value = result.compressedImageData;
      filePath.value = result.filePath;
      detectionResult.value!.clear();
      detectedImageUrl.value = '';
    } else {}
  }

  Future<void> pickImageFromGallery() async {
    final imageProcessor = ImageProcessor();

    ImagePick? result = await imageProcessor.pickImage(ImageSource.gallery);
    if (result != null) {
      Get.back();
      pickedImage.value = result.compressedImageData;
      filePath.value = result.filePath;
      detectionResult.value!.clear();
      detectedImageUrl.value = '';
    } else {}
  }

  Future<void> detectImage() async {
    try {
      isLoading.value = true;
      String uri = APIConstants.baseURI + APIConstants.objectDetectionModel;
      var request = http.MultipartRequest('POST', Uri.parse(uri));

      if (pickedImage.value != null && pickedImage.value!.isNotEmpty) {
        var file = await http.MultipartFile.fromPath(
          'image',
          filePath.value!,
        );
        request.files.add(file);
      } else {
        isLoading.value = false;
        debugPrint("No image selected");
        return;
      }

      var response = await request.send();
      final responseJson = await http.Response.fromStream(response);

      var results = jsonDecode(responseJson.body);

      if (response.statusCode == 200) {
        bird.value = BirdClassification.fromJson(results);

        isLoading.value = false;
        Get.toNamed(AppRoutes.classificationResult);
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }
}
