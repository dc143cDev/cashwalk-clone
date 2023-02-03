import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

class RadialLoading extends StatelessWidget {
  const RadialLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: Duration(seconds: 8),
        builder: (context, value, child) {
          int typeAData = (value * 100).ceil();
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
                      stops: [value, value],
                      center: Alignment.center,
                      colors: [
                        accentYellow,
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
                      //image로 바꿔서 ui 변화 가능.
                      image: DecorationImage(
                          image: Image.asset('assets/images/radial_scale.png')
                              .image),
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
                    child: Center(
                      child: Text("$typeAData"),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
