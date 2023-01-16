import 'package:cashwalkclone/app/modules/camera/controllers/camera_controller.dart';
import 'package:cashwalkclone/app/modules/walk/views/indicator_circular_view.dart';
import 'package:flutter/material.dart';

import '../../../../palette.dart';
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
              cameraController.applyBtnClicked();
            },
            icon: Icon(
              Icons.add_alert,
              color: accentYellow,
            ),
          ),
          IconButton(
            onPressed: () {
              controller.shareBtnClicked();
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
                        children: [
                          //Indicator type A
                          IndicatorCircularView(),
                          IndicatorCircularView(),
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
                        width: 265,
                      ),
                      FloatingActionButton.small(
                        backgroundColor: accentBrown,
                        onPressed: () {
                          controller.shareBtnClicked();
                        },
                        child: Icon(Icons.share),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
