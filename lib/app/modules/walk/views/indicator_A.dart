import 'package:flutter/material.dart';

class IndicatorA extends StatefulWidget {
  const IndicatorA({Key? key}) : super(key: key);

  @override
  State<IndicatorA> createState() => _IndicatorAState();
}

class _IndicatorAState extends State<IndicatorA> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 500,
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return SweepGradient(
                startAngle: 0.0,
                endAngle: 3.14 * 2,
                stops: [0.1, 0.1],
                center: Alignment.center,
                colors: [
                  Colors.greenAccent,
                  Colors.grey.withAlpha(200),
                ],
              ).createShader(rect);
            },
            child: Container(
              margin: EdgeInsets.all(30),
              height: 300,
              width: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 250,
              width: 460,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
