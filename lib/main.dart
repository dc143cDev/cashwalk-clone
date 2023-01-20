import 'package:cashwalkclone/app/modules/camera/controllers/camera_controller.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

Future main() async {
  await GetStorage.init();
  await GetStorage().read('mainPageImageIndex');
  await GetStorage().read('totalColor');
  await GetStorage().read('walkColor');
  await GetStorage().read('textColor');
  print(GetStorage().read('totalColor').toString());
  print(GetStorage().read('test'));
  print(GetStorage().read('cash'));
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
