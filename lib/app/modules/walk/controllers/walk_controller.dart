import 'dart:async';
import 'package:get_storage/get_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalkController extends GetxController {
  static WalkController get to => Get.find();
  final storage = GetStorage();

  RxString imagePath = '0'.obs;

  final isCameraBtnClicked = false.obs;
  final isShareBtnClicked = false.obs;

  final walk100maxSecond = 100;

  RxInt walk100 = 0.obs;
  RxInt walkTotal = 0.obs;
  RxInt pointCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    //위젯 시작시 페이지 이미지 데이터 가져옴.
    initPageIndex();
    //동시에 만보기 타이머 시작.
    startWalk();
    startPoint();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  initPageIndex() {
    imagePath.value = storage.read('mainPageImageIndex');
    print('init');
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

  CameraBtnClicked() {
    Get.toNamed('/camera');
  }

  late Timer _timer;

  void walkTotalUp() {
    walkTotal.value++;
  }

  void walk100Up() {
    walk100.value++;
  }

  pointCountUp() {
    if (walk100.value == 10) {}
    //포인트가 오를 때, 100 만보기의 값은 0이 됨. 100 걸음 = 1포인트.
  }

  //컨트롤러 init 시 작동되는 함수들.
  //Duration 주기(1초)마다 총 걸음수와 100걸음 걸음수를 1씩 증가시키고, storage 값을 한번씩 읽음.
  void startWalk() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      walkTotal.value++;
      walk100.value++;

      storage.listenKey('mainPageImageIndex', (value) {
        imagePath.value = storage.read('mainPageImageIndex');
      });
    });
  }

  void startPoint() {
    _timer = Timer.periodic(Duration(seconds: 100), (Timer timer) {
      walk100.value -= 100;
      pointCount.value++;
    });
  }
}
