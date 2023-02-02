import 'package:cashwalkclone/app/modules/health/views/health_map_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';

class HealthController extends GetxController {
  isFABClicked() {
    Get.to(HealthMapView());
  }

  HealthFactory health = HealthFactory();

  //읽기쓰기 권한 요청 미리 선언.
  var permissions = [
    HealthDataAccess.READ_WRITE,
    HealthDataAccess.READ_WRITE,
  ];

  //데이터 받아줄 그릇.
  List<HealthDataPoint> healthData = [];

  //ui 에 표시할 obs 데이터들.
  var distanceWalk = ''.obs;
  var healthSteps = ''.obs;
  var burnedEnergy = ''.obs;
  var moveMinutes = ''.obs;

  //ui controller
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    health.requestAuthorization;
    fetchHealthData();
    // Future.delayed(Duration(seconds: 1), () async {
    //   bool requested = await health.requestAuthorization(healthTypes);
    // });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future fetchHealthData() async {
    //받아올 데이터 타입들.
    var healthTypes = [
      HealthDataType.STEPS,
      HealthDataType.MOVE_MINUTES,
      HealthDataType.ACTIVE_ENERGY_BURNED,
      HealthDataType.HEART_RATE,
    ];

    //24시간마다 기록을 측정하기 위해 미리 선언.
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    bool requested = await health.requestAuthorization(healthTypes);

    if (requested) {
      try {
        healthData =
            await health.getHealthDataFromTypes(yesterday, now, healthTypes);
        for (HealthDataPoint h in healthData) {
          if (h.type == HealthDataType.HEART_RATE) {
            distanceWalk.value = '${h.value}';
          } else if (h.type == HealthDataType.ACTIVE_ENERGY_BURNED) {
            burnedEnergy.value = '${h.value}';
          } else if (h.type == HealthDataType.MOVE_MINUTES) {
            moveMinutes.value = '${h.value}';
          } else if (h.type == HealthDataType.STEPS) {
            healthSteps.value = '${h.value}';
          }
        }
      } catch (e) {
        print('health package err : ${e}');
      }

      healthData = HealthFactory.removeDuplicates(healthData);
    } else {
      print("Authorization not granted");
    }
  }
}
