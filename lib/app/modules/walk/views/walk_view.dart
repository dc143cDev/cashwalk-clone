import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';
import '../controllers/walk_controller.dart';

class WalkView extends GetView<WalkController> {
  const WalkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
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
      body: Center(
        child: Text(
          'WalkView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
