import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ConvenienceView extends GetView {
  const ConvenienceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConvenienceView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ConvenienceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
