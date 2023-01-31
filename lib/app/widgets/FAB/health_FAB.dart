import 'package:cashwalkclone/app/modules/health/controllers/health_controller.dart';
import 'package:flutter/material.dart';

import '../../../palette.dart';

class HealthFAB extends StatelessWidget {
  const HealthFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HealthController healthController = HealthController();

    return FloatingActionButton(
      heroTag: 'health',
      backgroundColor: accentYellow,
      elevation: 10,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient:
                LinearGradient(colors: [accentYellow, Colors.yellow.shade600])),
        child: Center(
          child: Icon(Icons.map),
        ),
      ),
      onPressed: () {
        healthController.isFABClicked();
      },
    );
  }
}
