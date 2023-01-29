import 'package:cashwalkclone/app/modules/community/views/community_view.dart';
import 'package:cashwalkclone/app/modules/friends/views/friends_view.dart';
import 'package:cashwalkclone/app/modules/health/views/health_view.dart';
import 'package:cashwalkclone/app/modules/my_bottom_nav_bar/controllers/my_bottom_nav_bar_controller.dart';
import 'package:cashwalkclone/app/modules/my_bottom_nav_bar/views/my_bottom_nav_bar_view.dart';
import 'package:cashwalkclone/app/modules/walk/views/walk_view.dart';
import 'package:cashwalkclone/app/widgets/FAB/friends_FAB.dart';
import 'package:get/get.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyBottomNavBarController());
    final List<Widget> pages = [
      WalkView(),
      FriendsView(),
      HealthView(),
      CommunityView(),
    ];

    final List<Widget> FAB = [
      FloatingActionButton(
        heroTag: 'main',
        backgroundColor: accentYellow,
        elevation: 10,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  colors: [accentYellow, Colors.yellow.shade600])),
          child: Center(
            child: Text('data'),
          ),
        ),
        onPressed: () {},
      ),
      DialFAB(),
      FloatingActionButton(
        onPressed: () {},
        child: Text('3'),
      ),
      FloatingActionButton(
        onPressed: () {},
        child: Text('4'),
      ),
    ];

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
