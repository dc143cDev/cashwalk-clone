import 'package:cashwalkclone/app/modules/community/views/community_view.dart';
import 'package:cashwalkclone/app/modules/friends/views/friends_view.dart';
import 'package:cashwalkclone/app/modules/health/views/health_view.dart';
import 'package:cashwalkclone/app/modules/news/views/news_view.dart';
import 'package:cashwalkclone/app/modules/walk/views/walk_view.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //네비게이션 바 페이지 위젯
  final List<Widget> pages = [
    WalkView(),
    FriendsView(),
    HealthView(),
    CommunityView(),
    NewsView(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        //선택되지 않은 아이템은 텍스트를 배경색과 같게하여 미표기.
        selectedLabelStyle:
            TextStyle(fontFamily: 'LS', fontWeight: FontWeight.w700),
        selectedItemColor: accentYellow,
        unselectedItemColor: mainGrey,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Friends'),
          BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety), label: 'Health'),
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_rounded), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
        ],
      ),
      //pages List 로 불러운 위젯들이 홈뷰 Scaffold 바디를 대체함.
      body: pages[selectedIndex],
    );
  }
}
