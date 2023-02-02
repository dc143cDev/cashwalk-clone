import 'package:cashwalkclone/app/modules/community/controllers/community_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';

class CommunityWriteView extends GetView<CommunityController> {
  const CommunityWriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CommunityController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textDark),
        title: Text(
          'Community',
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
        child: Text(
          'CommunityWriteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
