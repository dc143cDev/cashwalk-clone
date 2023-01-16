import 'dart:io';
import 'dart:math';

import 'package:cashwalkclone/app/widgets/galleryPageUnit.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

import '../../walk/controllers/walk_controller.dart';
import '../../walk/views/indicator_circular_view.dart';
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
      ),
      body: Center(
        child: Column(
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
            ElevatedButton(
              onPressed: () {
                controller.applyBtnClicked();
              },
              child: Text('적용하기'),
            ),
          ],
        ),
      ),
    );
  }
}
