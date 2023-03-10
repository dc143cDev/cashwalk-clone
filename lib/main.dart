import 'package:cashwalkclone/app/api/url_controller.dart';
import 'package:cashwalkclone/app/modules/camera/controllers/camera_controller.dart';
import 'package:cashwalkclone/app/modules/loading/controllers/loading_controller.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';

import 'app/routes/app_pages.dart';

Future main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  //헬스 권한 받기.
  await Permission.activityRecognition.request();
  //저장소 데이터로 작동하는 위젯들의 초기값 넣어주기.
  await GetStorage.init();
  await GetStorage().writeIfNull('imagePath', 'assets/images/yellow.jpg');
  await GetStorage().writeIfNull('cash', 1);
  await GetStorage().writeIfNull('currentCash', 1);
  await GetStorage().writeIfNull('totalColor', 0xFf4169e1);
  await GetStorage().writeIfNull('walkColor', 0xFFff69b4);
  await GetStorage().writeIfNull('textColor', 0xffffffff);
  await GetStorage().writeIfNull('userCM', 0);
  await GetStorage().writeIfNull('userWeight', 0);
  await GetStorage().read('mainPageImageIndex');
  await GetStorage().read('cash');
  await GetStorage().read('currentCash');
  await GetStorage().read('totalColor');
  await GetStorage().read('walkColor');
  await GetStorage().read('textColor');
  await GetStorage().read('userCM');
  await GetStorage().read('userWeight');
  print('imagePath.main:${GetStorage().read('imagePath')}');
  print('totalColor:${GetStorage().read('totalColor')}');
  print('totalColor:${GetStorage().read('totalColor').runtimeType}');
  print('cash:${GetStorage().read('cash')}');
  Get.put(UrlController());
  Get.put(LoadingController());
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        backgroundColor: bgColor,
        textTheme: TextTheme(
          bodyText2: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'IBMKR',
              color: textDark),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
