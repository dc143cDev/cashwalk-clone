import 'package:cashwalkclone/app/modules/community/views/community_view.dart';
import 'package:cashwalkclone/app/modules/friends/views/friends_view.dart';
import 'package:cashwalkclone/app/modules/health/views/health_view.dart';
import 'package:cashwalkclone/app/modules/my_bottom_nav_bar/controllers/my_bottom_nav_bar_controller.dart';
import 'package:cashwalkclone/app/modules/my_bottom_nav_bar/views/my_bottom_nav_bar_view.dart';
import 'package:cashwalkclone/app/modules/walk/views/walk_view.dart';
import 'package:cashwalkclone/app/widgets/FAB/community_FAB.dart';
import 'package:cashwalkclone/app/widgets/FAB/friends_FAB.dart';
import 'package:cashwalkclone/app/widgets/FAB/health_FAB.dart';
import 'package:cashwalkclone/app/widgets/FAB/walk_FAB.dart';
import 'package:get/get.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

//루트 페이지
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyBottomNavBarController());

    //페이지 위젯들 목록.
    final List<Widget> pages = [
      WalkView(),
      FriendsView(),
      HealthView(),
      CommunityView(),
    ];

    //FA 버튼 목록.
    final List<Widget> FAB = [
      WalkFAB(),
      FriendsFAB(),
      HealthFAB(),
      CommunityFAB(),
    ];

    //페이지 인덱스 변화를 컨트롤러가 감지에 앱의 body 부분에는 해당하는 페이지를,
    //앱의 FAB 가 들어갈 부분에는 커스텀 FAB 를 표시해줌.
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          Obx(() => FAB[MyBottomNavBarController.to.selectedIndex.value]),
      body: Obx(
        () => SafeArea(
            child: pages[MyBottomNavBarController.to.selectedIndex.value]),
      ),
      bottomNavigationBar: MyBottomNavBarView(),
    );
  }
}
