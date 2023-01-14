import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../controllers/camera_controller.dart';

class CameraView extends GetView<CameraController> {
  const CameraView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CameraView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Obx(
              () => controller.selectedImagePath.value == ''
                  ? Text('No image')
                  : Image.file(
                      File(controller.selectedImagePath.value),
                    ),
            ),
            SizedBox(
              height: 20,
            ),
            // FloatingActionButton(
            //   onPressed: () {
            //     controller.getImage(ImageSource.camera);
            //   },
            //   child: Text('c'),
            // ),
            FloatingActionButton(
              onPressed: () {
                controller.getImage(ImageSource.gallery);
              },
              child: Text('g'),
            ),
          ],
        ),
      ),
    );
  }
}
