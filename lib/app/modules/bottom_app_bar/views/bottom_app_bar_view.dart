import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bottom_app_bar_controller.dart';

class BottomAppBarView extends GetView<BottomAppBarController> {
  const BottomAppBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomAppBarView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BottomAppBarView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
