import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalkController extends GetxController {
  static WalkController get to => Get.find();

  final isCameraBtnClicked = false.obs;
  final isShareBtnClicked = false.obs;

  @override
  void onInit() {
    super.onInit();
    startWalk();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  shareBtnClicked() {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Bottom Sheet',
                style: TextStyle(fontSize: 18),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  startWalk() {}
}
