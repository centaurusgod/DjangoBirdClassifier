import 'package:flutter/material.dart';
import 'package:birds_classification/config/ext.dart';
import 'package:birds_classification/widgets/custom_elevated_button.dart';

class AddImageBottomSheet extends StatelessWidget {
  const AddImageBottomSheet({
    super.key,
    required this.onPressedGallery,
    required this.onPressedCamera,
  });

  final VoidCallback onPressedGallery;
  final VoidCallback onPressedCamera;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              const Icon(Icons.image_outlined),
              SizedBox(
                width: 8.w,
              ),
              CustomElevatedButton(
                  onPressed: onPressedGallery, buttonText: 'Gallery'),
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          Row(
            children: [
              const Icon(Icons.camera_alt_outlined),
              SizedBox(
                width: 8.w,
              ),
              CustomElevatedButton(
                  onPressed: onPressedCamera, buttonText: 'Camera'),
            ],
          )
        ],
      ),
    );
  }
}
