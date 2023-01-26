import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CoffeeBrandYdyView extends GetView {
  const CoffeeBrandYdyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CoffeeBrandYdyView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CoffeeBrandYdyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
