import 'package:cashwalkclone/app/modules/camera/controllers/camera_controller.dart';
import 'package:cashwalkclone/app/modules/quiz/views/quiz_widget_view.dart';
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

    CameraController cameraController = CameraController();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          'Walk',
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
              cameraController.read();
            },
            icon: Icon(
              Icons.add_alert,
              color: accentYellow,
            ),
          ),
          IconButton(
            onPressed: () {
              CameraController().debugBtn();
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
            Container(
              child: Stack(
                children: [
                  Obx(
                    () => Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              //카메라 컨트롤러의 selectedImagePath 스트링 값을 가져와 에셋이미지 패스 연결.
                              image: AssetImage(
                                  'assets/images/${controller.imagePath}.png')),
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
            Padding(
              padding: EdgeInsets.all(13),
              child: Stack(
                children: [
                  Container(
                    height: 240,
                    decoration: BoxDecoration(
                      color: bgColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                          spreadRadius: 0.0,
                          offset: Offset(0, 7),
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(22),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 108, 8, 8),
                      child: Row(
                        children: [
                          Text('data'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: accentPapaya,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                          spreadRadius: 0.0,
                          offset: Offset(0, 7),
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: bgColor,
                          child: Icon(
                            Icons.play_arrow,
                            color: accentPapaya,
                            size: 40,
                          ),
                        ),
                        SizedBox(
                          width: 230,
                          child: LinearProgressIndicator(
                            value: 10 / 100,
                            color: bgColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
