import 'package:flutter/material.dart';

import 'package:get/get.dart';

class IndicatorCircularDoubleView extends GetView {
  const IndicatorCircularDoubleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndicatorCircularDoubleView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'IndicatorCircularDoubleView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
