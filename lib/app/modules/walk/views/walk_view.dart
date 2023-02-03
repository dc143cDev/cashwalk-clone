import 'dart:io';
import 'package:cashwalkclone/app/modules/camera/controllers/camera_controller.dart';
import 'package:cashwalkclone/app/modules/notification/views/notification_view.dart';
import 'package:cashwalkclone/app/modules/quiz/views/quiz_widget_view.dart';
import 'package:cashwalkclone/app/modules/running/views/d_widget_view.dart';
import 'package:cashwalkclone/app/modules/running/views/running_widget_view.dart';
import 'package:cashwalkclone/app/modules/setting/views/setting_view.dart';
import 'package:cashwalkclone/app/modules/shopping/views/shopping_widget_view.dart';
import 'package:cashwalkclone/app/widgets/indicator/indicator_circular_view.dart';
import 'package:cashwalkclone/app/widgets/indicator/indicator_step_b_view.dart';
import 'package:cashwalkclone/app/widgets/indicator/indicator_step_view.dart';
import 'package:flutter/material.dart';

import '../../../../palette.dart';
import '../../../widgets/indicator/indicator_circular_b_view.dart';
import '../controllers/walk_controller.dart';
import 'package:get/get.dart';

class WalkView extends GetView<WalkController> {
  const WalkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(WalkController());
    Get.put(CameraController());

    return Scaffold(
      backgroundColor: bgColor,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Obx(
              () => Container(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              //카메라 컨트롤러의 selectedImagePath 스트링 값을 가져와 에셋이미지 패스 연결.
                              image: controller.imagePath.value ==
                                      'assets/images/yellow.jpg'
                                  ? AssetImage('assets/images/yellow.jpg')
                                      as ImageProvider
                                  : FileImage(
                                      File(
                                          controller.storage.read('imagePath')),
                                    )),
                          color: bgColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: mainGrey,
                                offset: Offset(0.0, 1.0),
                                blurRadius: 6.0),
                          ]),
                      height: 350,
                      width: 500,
                      child: PageView(
                        controller: controller.indicatorController,
                        onPageChanged: controller.onIndicatorPageChanged,
                        children: [
                          //Indicator
                          IndicatorCircularView(),
                          IndicatorStepView(),
                          IndicatorCircularBView(),
                          IndicatorStepBView(),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        FloatingActionButton.small(
                          heroTag: 'goToCamera',
                          backgroundColor: accentBrown,
                          onPressed: () {
                            controller.CameraBtnClicked();
                          },
                          child: Icon(Icons.camera),
                        ),
                        SizedBox(
                          width: 305,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            ShoppingWidgetView(),
            SizedBox(
              height: 7,
            ),
            QuizWidgetView(),
            SizedBox(
              height: 7,
            ),
            RunningWidgetView(),
            SizedBox(
              height: 7,
            ),
            DWidget(),
          ],
        ),
      ),
    );
  }
}
