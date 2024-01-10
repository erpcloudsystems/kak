import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'user_photo_widget.dart';
import '../../../../../core/resources/values_manager.dart';

class UserPhotoInEditingScreen extends StatefulWidget {
  final Function fileName;
  final Function updatedPhoto64;

  const UserPhotoInEditingScreen({
    super.key,
    required this.fileName,
    required this.updatedPhoto64,
  });

  @override
  State<UserPhotoInEditingScreen> createState() =>
      _UserPhotoInEditingScreenState();
}

class _UserPhotoInEditingScreenState extends State<UserPhotoInEditingScreen> {
  XFile? pickedImage;

  Future<void> pickAnImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    setState(() => pickedImage = image);

    // Giving the name of the image and if it's greater than 140 we make another uuid because Frappe only accept 140 characters.
    final filePath = image!.path;
    widget.fileName(
      filePath.length <= 140 ? filePath : '${const Uuid().v1()}.jpg',
    );

    // Convert the image to Base64 to send it to the Backend.
    final imageBytes = await image.readAsBytes();
    final images64 = base64Encode(imageBytes);
    widget.updatedPhoto64(images64);
  }

  @override
  Widget build(BuildContext context) {
    return UserPhotoWidget(
        radius: DoubleManager.d_40,
        sideWidget: OutlinedButton(
            onPressed: () => pickAnImage(),
            child: const Text('Change your photo')),
        image: pickedImage == null
            ? null
            : FileImage(
                File(pickedImage!.path),
              ));
  }
}