import 'dart:developer';

import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker _picker = ImagePicker();
  Future<XFile?> getImageFromGallery() async {
    try {
      XFile? file = await _picker.pickImage(source: ImageSource.gallery);
      return file;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
