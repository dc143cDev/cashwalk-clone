import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CameraController extends GetxController {
  WalkController walkController = WalkController();
  final storage = GetStorage();

  var totalColor = Color(0xFf4169e1).obs;
  var walkColor = Color(0xFFff69b4).obs;
  var textColor = Color(0xFFdd972b).obs;

  var selectedImagePath = '0'.obs;

  var galleryPageIndex = 0.obs;

  final pageController = PageController(initialPage: 0);

  onGalleryPageChanged(int page) {
    print('page num:' + page.toString());
    int currentPage = page.toInt();
    //페이지가 바뀔때마다 호출. 즉, galleryPageIndex 가 현재 페이지를 담게 됨.
    galleryPageIndex.value = currentPage;
    print('main page image path:' + selectedImagePath.value.toString());
    print('current page:' + galleryPageIndex.value.toString());
  }

  applyBtnClicked() {
    selectedImagePath.value = galleryPageIndex.value.toString();
    storage.write('mainPageImageIndex', selectedImagePath.value);
    print('write:' + storage.read('mainPageImageIndex'));
  }

  totalColorChangeBtnClicked() {
    Get.dialog(
      AlertDialog(
        content: ColorPicker(
          pickerColor: totalColor.value,
          onColorChanged: (Color color) {
            totalColor.value = color;
            print(totalColor.value);
          },
          pickerAreaHeightPercent: 0.9,
          enableAlpha: true,
          paletteType: PaletteType.hsvWithHue,
        ),
      ),
    );
  }

  walkColorChangeBtnClicked() {
    Get.dialog(
      AlertDialog(
        content: ColorPicker(
          pickerColor: walkColor.value,
          onColorChanged: (Color color) {
            walkColor.value = color;
            print(walkColor.value);
          },
          pickerAreaHeightPercent: 0.9,
          enableAlpha: true,
          paletteType: PaletteType.hsvWithHue,
        ),
      ),
    );
  }

  textColorChangeBtnClicked() {
    Get.dialog(
      AlertDialog(
        content: ColorPicker(
          pickerColor: textColor.value,
          onColorChanged: (Color color) {
            textColor.value = color;
            print(textColor.value);
          },
          pickerAreaHeightPercent: 0.9,
          enableAlpha: true,
          paletteType: PaletteType.hsvWithHue,
        ),
      ),
    );
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
}
