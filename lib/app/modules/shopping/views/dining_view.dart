import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DiningView extends GetView {
  const DiningView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DiningView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DiningView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
