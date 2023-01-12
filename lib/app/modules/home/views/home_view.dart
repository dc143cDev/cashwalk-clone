import 'package:cashwalkclone/app/modules/community/views/community_view.dart';
import 'package:cashwalkclone/app/modules/friends/views/friends_view.dart';
import 'package:cashwalkclone/app/modules/health/views/health_view.dart';
import 'package:cashwalkclone/app/modules/my_bottom_nav_bar/controllers/my_bottom_nav_bar_controller.dart';
import 'package:cashwalkclone/app/modules/my_bottom_nav_bar/views/my_bottom_nav_bar_view.dart';
import 'package:cashwalkclone/app/modules/news/views/news_view.dart';
import 'package:cashwalkclone/app/modules/walk/views/walk_view.dart';
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
      NewsView(),
    ];

    return Scaffold(
      body: Obx(
        () => SafeArea(
            child: pages[MyBottomNavBarController.to.selectedIndex.value]),
      ),
      bottomNavigationBar: MyBottomNavBarView(),
    );
  }
}
