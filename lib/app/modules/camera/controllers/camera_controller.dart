import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CameraController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  PickedFile? image;

  void getImage(ImageSource imageSource) async {
    final pickedFile =
        await ImagePicker.platform.pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value == pickedFile.path;
      selectedImagePath.value ==
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              "Mb";
    } else {
      Get.snackbar('Error', 'No image');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future galleryButtonClicked() async {
    var _image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    image = _image;
  }
}
