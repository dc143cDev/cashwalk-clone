import 'dart:io';
import 'dart:math';

import 'package:cashwalkclone/app/widgets/custom_button_brown.dart';
import 'package:cashwalkclone/app/widgets/galleryPageUnit.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

import '../../walk/controllers/walk_controller.dart';
import '../../../widgets/indicator/indicator_circular_view.dart';
import '../controllers/camera_controller.dart';

class CameraView extends GetView<CameraController> {
  CameraView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        title: const Text(
          '갤러리',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'IBMKR',
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          Center(
            child: Obx(
              () => Text(
                controller.galleryPageIndexPlus.value.toString() + '/5',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'IBMKR',
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            width: 40,
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
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
                controller: controller.pageController,
                //페이지 변경시 onGalleryPageChanged 호출
                onPageChanged: controller.onGalleryPageChanged,
                children: [
                  //galleryPageUnit 커스텀 위젯으로 코드 단축. 모듈화.
                  PageUnit(
                    assetImage: AssetImage('assets/images/0.png'),
                  ),
                  PageUnit(
                    assetImage: AssetImage('assets/images/1.png'),
                  ),
                  PageUnit(
                    assetImage: AssetImage('assets/images/2.png'),
                  ),
                  PageUnit(
                    assetImage: AssetImage('assets/images/3.png'),
                  ),
                  PageUnit(
                    assetImage: AssetImage('assets/images/4.png'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    controller.totalColorChangeBtnClicked();
                  },
                  child: Container(
                    height: 85,
                    width: 165,
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
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: Color(controller.storage.read('totalColor')),
                            backgroundColor: bgColor,
                            strokeWidth: 3,
                            value: 70 / 100,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '총 걸음 표시\n색상 선택하기',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'IBMKR'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                GestureDetector(
                  onTap: () {
                    controller.walkColorChangeBtnClicked();
                  },
                  child: Container(
                    height: 85,
                    width: 165,
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
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            color: Color(controller.storage.read('walkColor')),
                            backgroundColor: bgColor,
                            strokeWidth: 3,
                            value: 90 / 100,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '목표 걸음 표시\n색상 선택하기',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              fontFamily: 'IBMKR'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                controller.textColorChangeBtnClicked();
              },
              child: Container(
                height: 85,
                width: 355,
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
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'T',
                      style: TextStyle(
                          fontFamily: 'LS',
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color(controller.storage.read('textColor'))),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '텍스트\n색상 선택하기',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          fontFamily: 'IBMKR'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 360,
                  child: CustomButtonBrown(
                    btnText: '적용하기',
                    onPressed: () {
                      controller.applyBtnClicked();
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
