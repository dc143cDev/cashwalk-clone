import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../palette.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textDark),
        title: Text(
          'Setting',
          style: TextStyle(
              fontFamily: 'LS',
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: accentYellow),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: bgColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                controller.is10kUpBtnClicked();
              },
              child: Text('+ 10k cash')),
          ElevatedButton(
            onPressed: () {
              GetStorage().remove('imagePath');
              GetStorage().remove('cash');
              GetStorage().remove('currentCash');
              GetStorage().remove('totalColor');
              GetStorage().remove('walkColor');
              GetStorage().remove('textColor');
            },
            child: Text('delete all'),
          ),
        ],
      ),
    );
  }
}
