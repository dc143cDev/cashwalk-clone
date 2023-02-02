import 'package:flutter/material.dart';

import '../../../../palette.dart';

class HealthCard extends StatelessWidget {
  const HealthCard({
    Key? key,
    this.onPressed,
    required this.btnText,
    required this.icon,
    required this.data,
  }) : super(key: key);

  final Function()? onPressed;
  final Icon icon;
  final String btnText;
  final String data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: bgColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
                spreadRadius: 0.0,
                offset: Offset(0, 7),
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(22),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                SizedBox(
                  height: 5,
                ),
                Text(
                  data,
                  maxLines: 1,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(btnText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
