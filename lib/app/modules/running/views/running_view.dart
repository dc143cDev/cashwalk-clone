import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/running_controller.dart';

class RunningView extends GetView<RunningController> {
  const RunningView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RunningView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RunningView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
