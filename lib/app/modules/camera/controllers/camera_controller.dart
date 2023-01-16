import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CameraController extends GetxController {
  WalkController walkController = WalkController();
  final storage = GetStorage();

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
