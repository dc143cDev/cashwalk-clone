import 'dart:async';
import 'package:get_storage/get_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalkController extends GetxController {
  static WalkController get to => Get.find();
  //get storage 사용하기 쉽게 미리 선언.
  final storage = GetStorage();

  //camera controller 쪽에서 넘길 인덱스를 받아줄 그릇.
  RxString imagePath = '0'.obs;

  //camera controller 쪽에서 넘길 세가지 색상 값을 받아줄 그릇들.
  var currentTotalColor = Color(0xFf4169e1).obs;
  var currentWalkColor = Color(0xFFff69b4).obs;
  var currentTextColor = Color(0xFFdd972b).obs;

  //100걸음과 총 걸음수 최대값. 목업이기에 사용하는 것이지, 실제론 이러면 안됨.
  final walk100maxSecond = 100;
  final walkTotalMax = 1000;

  //아래 타이머로 변화될 값들. 이 값들이 circular indicator 로 전해져서 ui의 애니메이션처럼 표현.
  RxInt walk100 = 0.obs;
  RxInt walkTotal = 0.obs;
  RxInt pointCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    //위젯 시작시 페이지 이미지 및 색상 데이터 가져옴.
    initPageIndex();
    //동시에 두가지 만보기 타이머 시작.
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

  //위에서 호출한 메소드. 이미지 인덱스를 get storage 에서 읽어옴.
  //camera controller 에서 get storage 에 저장한 인덱스 값.
  initPageIndex() {
    imagePath.value = storage.read('mainPageImageIndex');
    // currentTotalColor.value = storage.read('totalColor');
    // currentWalkColor.value = storage.read('walkColor');
    // currentTextColor.value = storage.read('textColor');
    print('init');
  }

  //공유 버튼 클릭시 호출.
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

  //카메라 버튼 클릭시 호출. 네비게이션.
  CameraBtnClicked() {
    Get.toNamed('/camera');
  }

  //타이머.
  late Timer _timer;

  //컨트롤러 init 시 작동되는 함수들.
  //Duration 주기(1초)마다 총 걸음수와 100걸음 걸음수를 1씩 증가시키고, storage 값을 한번씩 읽음.
  void startWalk() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      walkTotal.value++;
      walk100.value++;

      storage.listenKey('mainPageImageIndex', (value) {
        imagePath.value = storage.read('mainPageImageIndex');
      });

      storage.listenKey('totalColor', (value) {
        currentTotalColor.value = storage.read('totalColor');
      });
      storage.listenKey('walkColor', (value) {
        currentWalkColor.value = storage.read('walkColor');
      });
      storage.listenKey('textColor', (value) {
        currentTextColor.value = storage.read('textColor');
      });
    });
  }

  //init 시 호출되는 또 다른 메소드.
  // 사실 100만큼 올라갈때마다 그걸 감지해야 하는데, 목업이기에 임의로 100초 간격으로 업데이트.
  void startPoint() {
    _timer = Timer.periodic(Duration(seconds: 100), (Timer timer) {
      walk100.value -= 100;
      pointCount.value++;
    });
  }
}
