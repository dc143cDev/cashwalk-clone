import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';
import '../../notification/views/notification_view.dart';
import '../../setting/views/setting_view.dart';
import '../controllers/health_controller.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'health_card.dart';

class HealthMapView extends GetView<HealthController> {
  const HealthMapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textDark),
        title: Text(
          'Cash Walk',
          style: TextStyle(
              fontFamily: 'LS',
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: accentYellow),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: bgColor,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(NotificationView());
            },
            icon: Icon(
              Icons.add_alert,
              color: accentYellow,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(SettingView());
            },
            icon: Icon(
              Icons.settings,
              color: accentYellow,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: GoogleMap(
              initialCameraPosition: _kGooglePlex,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                shape: BoxShape.rectangle,
                color: accentYellow,
              ),
              child: Center(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  children: [
                    HealthCard(
                      btnText: 'Kcal',
                      icon: Icon(
                        Icons.local_fire_department_rounded,
                        size: 40,
                      ),
                      data: '${controller.burnedEnergy.value}',
                    ),
                    HealthCard(
                      btnText: 'minutes',
                      icon: Icon(
                        Icons.timer,
                        size: 40,
                      ),
                      data: '${controller.moveMinutes.value}',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
}
