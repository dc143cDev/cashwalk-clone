import 'package:cashwalkclone/app/modules/health/views/health_card.dart';
import 'package:cashwalkclone/app/modules/notification/views/notification_view.dart';
import 'package:cashwalkclone/app/modules/setting/views/setting_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';
import '../controllers/health_controller.dart';

class HealthView extends GetView<HealthController> {
  const HealthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HealthController());

    HealthController healthController = HealthController();
    return Scaffold(
      backgroundColor: accentYellow,
      appBar: AppBar(
        title: Text(
          'Cash Walk',
          style: TextStyle(
              fontFamily: 'LS',
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: accentYellow),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: bgColor,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(NotificationView());
            },
            icon: Icon(
              Icons.add_alert,
              color: accentYellow,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(SettingView());
            },
            icon: Icon(
              Icons.settings,
              color: accentYellow,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.accessibility_new_sharp,
                        size: 80,
                      ),
                      Column(
                        children: [
                          Text('키 데이터 cm'),
                          Text('몸무게 데이터 kg'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${controller.healthSteps.value}',
                        style: TextStyle(fontSize: 40),
                      ),
                      Text('걸음'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                shape: BoxShape.rectangle,
                color: bgColor,
              ),
              child: Center(
                child: GridView.count(
                  mainAxisSpacing: 1,
                  crossAxisCount: 2,
                  children: [
                    HealthCard(
                      btnText: 'Kcal',
                      icon: Icon(
                        Icons.local_fire_department_rounded,
                        size: 40,
                      ),
                      data: '${controller.burnedEnergy.value}',
                    ),
                    HealthCard(
                      btnText: 'minutes',
                      icon: Icon(
                        Icons.timer,
                        size: 40,
                      ),
                      data: '${controller.moveMinutes.value}',
                    ),
                    HealthCard(
                      btnText: 'm',
                      icon: Icon(
                        Icons.pin_drop,
                        size: 40,
                      ),
                      data: '1592',
                    ),
                    HealthCard(
                      btnText: 'km/h',
                      icon: Icon(
                        Icons.speed,
                        size: 40,
                      ),
                      data: '3.14',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
