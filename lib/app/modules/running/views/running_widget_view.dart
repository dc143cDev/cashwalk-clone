import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RunningWidgetView extends GetView {
  const RunningWidgetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RunningWidgetView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RunningWidgetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
