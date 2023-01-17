import 'package:flutter/material.dart';

import 'package:get/get.dart';

class IndicatorStepView extends GetView {
  const IndicatorStepView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndicatorStepView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'IndicatorStepView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
