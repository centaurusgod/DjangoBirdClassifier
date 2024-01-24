import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class ImageProcessor {
  Future<ImagePick?> pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return null;

    File file = File(image.path);

    Uint8List compressedImageData = await _compressImage(file);

    return ImagePick(
      compressedImageData: compressedImageData,
      filePath: file.path,
    );
  }

  Future<Uint8List> _compressImage(File file) async {
    final Uint8List? compressedImage = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      quality: 70, // Adjust quality
      format: CompressFormat.jpeg,
    );
    return compressedImage ?? await file.readAsBytes();
  }
}

class ImagePick {
  final Uint8List compressedImageData;
  final String filePath;

  ImagePick({required this.compressedImageData, required this.filePath});
}
