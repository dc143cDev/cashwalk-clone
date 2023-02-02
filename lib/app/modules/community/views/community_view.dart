import 'package:cashwalkclone/app/model/chat/chat_ui_model.dart';
import 'package:cashwalkclone/app/modules/notification/views/notification_view.dart';
import 'package:cashwalkclone/app/modules/setting/views/setting_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';
import '../controllers/community_controller.dart';

class CommunityView extends GetView<CommunityController> {
  const CommunityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CommunityController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      appBar: AppBar(
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
        actions: [
          IconButton(
            onPressed: () {
              Get.to(NotificationView());
            },
            icon: Icon(
              Icons.add_alert,
              color: accentYellow,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(SettingView());
            },
            icon: Icon(
              Icons.settings,
              color: accentYellow,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: controller.obx(
          (data) => ListView.builder(
            itemCount: data?.length,
            itemBuilder: (context, index) {
              var details = data?[index];
              return ChatUIModel(
                model: details,
              );
            },
          ),
        ),
      ),
    );
  }
}
