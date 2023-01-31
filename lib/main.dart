import 'package:cashwalkclone/app/modules/camera/controllers/camera_controller.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

Future main() async {
  await GetStorage.init();
  await GetStorage().writeIfNull('mainPageImageIndex', '0');
  await GetStorage().writeIfNull('cash', 1);
  await GetStorage().writeIfNull('currentCash', 1);
  await GetStorage().writeIfNull('totalColor', 0xFf4169e1);
  await GetStorage().writeIfNull('walkColor', 0xFFff69b4);
  await GetStorage().writeIfNull('textColor', 0xffffffff);
  await GetStorage().save();
  await GetStorage().read('mainPageImageIndex');
  await GetStorage().read('cash');
  await GetStorage().read('totalColor');
  await GetStorage().read('walkColor');
  await GetStorage().read('textColor');
  print('mainPageIndex:${GetStorage().read('mainPageImageIndex')}');
  print('totalColor:${GetStorage().read('totalColor')}');
  print('totalColor:${GetStorage().read('totalColor').runtimeType}');
  print('cash:${GetStorage().read('cash')}');
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
