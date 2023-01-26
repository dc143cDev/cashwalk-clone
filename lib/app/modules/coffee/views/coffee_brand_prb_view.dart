import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CoffeeBrandPrbView extends GetView {
  const CoffeeBrandPrbView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CoffeeBrandPrbView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CoffeeBrandPrbView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
