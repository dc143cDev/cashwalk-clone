import 'dart:async';
import 'package:get_storage/get_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:pedometer/pedometer.dart';

import '../../../widgets/custom_button_yellow.dart';

//--사이클--
//Controller 빌드 시 onInit 실행=>
//onInit 으로 initPageValue 함수, startWalk 함수 호출=>
//if 문으로 storage 값이 존재할시 그대로 적용하고, null 이라면 기본 색상 및 기본 인덱스 적용=>
//동시에 startWalk 실행됨=>
//초마다 포인트 상승. 초마다 storage 의 value 를 listenKey 로 감지=>
//CameraController 에서 storage 의 value 를 수정하면 즉각 적용.
class WalkController extends GetxController {
  static WalkController get to => Get.find();
  //get storage 사용하기 쉽게 미리 선언.
  final storage = GetStorage();
  //camera controller 쪽에서 넘길 이미지 패스를 받아줄 그릇.
  var imagePath = ''.obs;

  //camera controller 쪽에서 넘길 세가지 색상 값을 받아줄 그릇들.
  //아래 타이머 위젯으로 1초마다 감지하여 실시간으로 변함.
  //storage 에 저장될 값은 Color() 가 아닌 int 이기에 우선 0으로 지정.
  var currentTotalColor = 0xFf4169e1.obs;
  var currentWalkColor = 0xFFff69b4.obs;
  var currentTextColor = 0xffffffff.obs;

  var dialogNeverSeenAgain = false.obs;

  //100걸음과 총 걸음수 최대값.
  //목업이기에 사용하는 것이지, 실제로는 유저가 맥스값을 설정할수 있게 해야함.
  //이제 최대값은 설정할수 있게 함. 20230201
  final walk100maxSecond = 100;
  final walkTotalMax = 1000;

  //인디케이터 index
  var indicatorIndex = 0.obs;
  var currentIndicator = 0.obs;

  final indicatorController = PageController(initialPage: 0, keepPage: true);

  //아래 타이머로 변화될 값들. 이 값들이 circular indicator 로 전해져서 ui의 애니메이션처럼 표현.
  RxInt walk100 = 0.obs;
  RxInt walkTotal = 0.obs;
  var cashCount = 0.obs;
  var pointCount = 0.obs;
  // /5
  RxInt walk100s5 = 0.obs;
  RxInt walkTotals5 = 0.obs;

  @override
  void onInit() {
    super.onInit();

    print('imagePath.storage:${storage.read('imagePath')}');
    print('imagePath:${imagePath.value}');

    print('point.storage:${storage.read('cash')}');
    print('point:${pointCount.value}');

    print('cash.storage:${storage.read('currentCash')}');
    print('cash:${cashCount.value}');

    //이미지
    imagePath.value = storage.read('imagePath');
    //포인트 데이터 불러오기.
    pointCount.value = storage.read('cash');
    cashCount.value = storage.read('currentCash');
    //health
    // startHealth();
    pedometerInit();
    //위젯 시작시 페이지 이미지 및 색상 데이터 가져옴.
    initPageValue();
    //동시에 리스너 타이머 시작.
    startWalk();
  }

  @override
  void onReady() {
    super.onReady();
    initDialog();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //위에서 호출한 메소드. 이미지 인덱스를 get storage 에서 읽어옴.
  //camera controller 에서 get storage 에 저장한 인덱스 값.
  //storage 의 값들을 체크하여 값이 null 일 경우 기본 값으로 저장한 값들로 변경.
  initPageValue() {
    print('imagePath:${imagePath.value}');
    //null 이면 메인에서 기본 컬러로 처리함.
    currentTotalColor.value = storage.read('totalColor');
    currentWalkColor.value = storage.read('walkColor');
    currentTextColor.value = storage.read('textColor');
    print('init');
  }

  initDialog() {
    Get.dialog(
      AlertDialog(
        content: Column(
          children: [
            Container(
              height: 200,
            ),
            Row(
              children: [
                CustomButtonYellow(
                  btnText: '확인',
                  onPressed: () {
                    Get.back();
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                CustomButtonYellow(
                  btnText: '확인',
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  onIndicatorPageChanged(int page) {
    print('page num:' + page.toString());
    int currentIndicator = page.toInt();
    //페이지가 바뀔때마다 호출. 즉, galleryPageIndex 가 현재 페이지를 담게 됨.
    indicatorIndex.value = currentIndicator;
    print(currentIndicator);
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

  //pedometer part.

  //상태 체크용. 지금은 딱히 사용 안함.
  var pedometerStatus = ''.obs;

  //스트림 선언.
  late Stream<StepCount> stepCountStream;

  //steps 은 실제 ui 에 표시될 진짜 걸음 수.
  //stepsForPoint 는 stepsPointVisible 이 값을 감지할수 있도록 거쳐가는 용도.
  //stepsPointVisible 은 유저가 다음 포인트까지 얼마나 남았는지 알수있도록
  //ui 에 표시될 데이터를 담아줄 용도.
  var steps = '0'.obs;
  var stepsForPoint = 0.obs;
  var stepsPointVisible = 0.obs;

  pedometerInit() {
    stepCountStream = Pedometer.stepCountStream;
    stepCountStream.listen(onStepCount).onError(onStepCountError);
  }

  onStatus(PedestrianStatus event) {
    pedometerStatus.value = event.status;
    DateTime timeStamp = event.timeStamp;
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    steps.value = 'Step Count not available';
  }

  onStepCount(StepCount event) {
    //steps 는 ui 에 표시되어야하기에 스트링 값으로 받아줌.
    //stepsForPoint.value == steps.
    steps.value = event.steps.toString();
    stepsForPoint.value = event.steps;
    stepsPointVisible.value++;
    print('steps value: ${steps.value}');
    DateTime timeStamp = event.timeStamp;

    //stepsForPoint 는 int 값이라 연산자에 대입 가능.
    //100 단위가 될때마다 stepsPointVisible 을 0 으로 돌리는 역할을 함.
    //로직은 100으로 나눈 수가 0일때마다 stepsPointVisible 의 값을 0으로 바꾸고 포인트 ++.
    if (stepsForPoint.value % 100 == 0) {
      stepsPointVisible.value = 0;
      pointCount.value++;
      print('pointCount++');
    }
  }

  //health part.
  //구글 인증 이슈로 일단 보류.

  var HealthWalkPoint = 0.obs;

  //타이머.
  late Timer _timer;

  //컨트롤러 init 시 작동되는 함수들.
  //Duration 주기(1초) 마다 storage 값을 한번씩 읽음.
  void startWalk() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      print('steps value : ${steps.value}');
      print('steps for point value: ${stepsPointVisible.value} / 100');

      storage.write('indicatorIndex', indicatorIndex.value);

      storage.listenKey('imagePath', (value) {
        imagePath.value = value;
      });

      storage.listenKey('totalColor', (value) {
        currentTotalColor.value = value;
      });

      storage.listenKey('walkColor', (value) {
        currentWalkColor.value = value;
      });

      storage.listenKey('textColor', (value) {
        currentTextColor.value = value;
      });
    });
  }

  walkFABClicked() {
    if (pointCount.value > 0) {
      pointCount.value -= 1;
      cashCount.value++;
      storage.write('cash', pointCount.value);
      storage.write('currentCash', cashCount.value);
      storage.save();
    } else {}
  }
}
