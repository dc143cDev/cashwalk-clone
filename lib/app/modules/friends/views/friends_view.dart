import 'package:cashwalkclone/app/modules/friends/controllers/friends_dial_controller.dart';
import 'package:cashwalkclone/app/modules/friends/views/friends_accept_view.dart';
import 'package:cashwalkclone/app/modules/friends/views/friends_invite_view.dart';
import 'package:cashwalkclone/app/modules/friends/views/friends_ranking_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';
import '../controllers/friends_controller.dart';

//탭 바의 애니메이션과, speed dial 의 애니메이션 두개를 모두 컨트롤 해주어야 하기에,
//friends view 에서는 두개의 컨트롤러를 사용함.
//두 컨트롤러 모두 GetController 와 GetSingleTickerProviderStateMixin 를 혼합하여 사용.

class FriendsView extends GetView<FriendsController> {
  const FriendsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(FriendsController());
    Get.lazyPut(() => FriendsDialController());

    FriendsDialController friendsDialController = FriendsDialController();

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        bottom: TabBar(
          indicatorColor: accentBrown,
          dividerColor: accentBrown,
          controller: controller.tabController,
          tabs: controller.myTabs,
        ),
        title: Text(
          'Walk',
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
            onPressed: () {},
            icon: Icon(
              Icons.add_alert,
              color: accentYellow,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: accentYellow,
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          FriendsRankingView(),
          FriendsInviteView(),
          FriendsAcceptView(),
        ],
      ),
    );
  }
}
