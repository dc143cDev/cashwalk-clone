import 'package:flutter/material.dart';

import 'package:get/get.dart';

class IndicatorLinearBView extends GetView {
  const IndicatorLinearBView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndicatorLinearBView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'IndicatorLinearBView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
