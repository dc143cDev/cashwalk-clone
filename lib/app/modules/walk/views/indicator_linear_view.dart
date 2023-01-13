import 'package:flutter/material.dart';

import 'package:get/get.dart';

class IndicatorLinearView extends GetView {
  const IndicatorLinearView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndicatorLinearView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'IndicatorLinearView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
