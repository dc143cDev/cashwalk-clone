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
      floatingActionButton: SpeedDial(
        openCloseDial: friendsDialController.isDialOpen,
        onOpen: () {},
        onClose: () {
          friendsDialController.isDialBtnClosed();
        },
        onPress: () {
          friendsDialController.isDialBtnClicked();
        },
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: friendsDialController.animationController,
        ),
        backgroundColor: accentYellow,
        //dial item 들.
        //클릭시 해당 함수에 해당하는 디알로그 출력.
        children: [
          SpeedDialChild(
              child: Icon(
                Icons.add,
                color: accentBrown,
              ),
              label: '친구 추가하기',
              onTap: () {
                friendsDialController.isAddBtnClicked();
              }),
          SpeedDialChild(
              child: Icon(
                Icons.search_rounded,
                color: accentBrown,
              ),
              label: '친구 검색',
              onTap: () {
                friendsDialController.isSearchBtnClicked();
              }),
          SpeedDialChild(
              child: Icon(
                Icons.people_rounded,
                color: accentBrown,
              ),
              label: '친구 관리',
              onTap: () {
                friendsDialController.isControlBtnClicked();
              }),
          SpeedDialChild(
              child: Icon(
                Icons.share,
                color: accentBrown,
              ),
              label: 'SNS 연동',
              onTap: () {
                friendsDialController.isSNSBtnClicked();
              }),
        ],
      ),
      appBar: AppBar(
        bottom: TabBar(
          indicatorColor: accentBrown,
          dividerColor: accentBrown,
          controller: controller.tabController,
          tabs: controller.myTabs,
        ),
        title: Text(
          'Cash Walk',
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
