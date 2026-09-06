import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File> customImagePicker() async {
  final imagePicker = await ImagePicker().pickImage(source: ImageSource.camera);
  final imageFile = File(imagePicker!.path);

  return imageFile;
}

Future<File> customImagePickerFromGallery() async {
  final imagePicker = await ImagePicker().pickImage(
    source: ImageSource.gallery,
  );
  final imageFile = File(imagePicker!.path);

  return imageFile;
}
