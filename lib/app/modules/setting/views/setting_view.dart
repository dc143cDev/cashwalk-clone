import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../palette.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: ElevatedButton(
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
      ),
    );
  }
}
