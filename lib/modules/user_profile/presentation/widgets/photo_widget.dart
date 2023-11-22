// import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/resources/values_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/utils/custom_cached_image.dart';

class UserPhotoWidget extends StatefulWidget {
  const UserPhotoWidget({super.key});

  @override
  State<UserPhotoWidget> createState() => _UserPhotoWidgetState();
}

class _UserPhotoWidgetState extends State<UserPhotoWidget> {
  String? fileName;
  XFile? pickedImage;

  Future<void> pickAnImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    setState(() => pickedImage = image);

    // Giving the name of the image and if it's greater than 140
    // we make another uuid because Frappe only accept 140 characters.
    final filePath = image!.path;
    fileName = filePath.length <= 140 ? filePath : '${const Uuid().v1()}.jpg';

    // Convert the image to Base64 to send it to the Backend.
    // final imageBytes = await image.readAsBytes();
    // final images64 = base64Encode(imageBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DoubleManager.d_20),
      child: Stack(
          alignment: Alignment.bottomRight,
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
                radius: DoubleManager.d_50,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: pickedImage != null
                      ? Image(image: FileImage(File(pickedImage!.path)))
                      : const CustomCachedImage(url: userTestImage),
                )),
            ImagePickerButton(onPressed: () => pickAnImage()),
          ]),
    );
  }
}

class ImagePickerButton extends StatelessWidget {
  const ImagePickerButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DoubleManager.d_35,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorsManager.mainColor,
      ),
      child: IconButton(
        onPressed: onPressed,
        iconSize: DoubleManager.d_20,
        color: Colors.white,
        icon: const Icon(Icons.camera_alt_outlined),
      ),
    );
  }
}

const String userTestImage =
    'https://img.freepik.com/premium-vector/anonymous-user-circle-icon-vector-illustration-flat-style-with-long-shadow_520826-1931.jpg';
