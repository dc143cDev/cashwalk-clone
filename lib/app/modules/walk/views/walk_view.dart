import 'package:flutter/material.dart';

import '../../../../palette.dart';

class WalkView extends StatefulWidget {
  const WalkView({Key? key}) : super(key: key);

  @override
  State<WalkView> createState() => _WalkViewState();
}

class _WalkViewState extends State<WalkView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
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
            onPressed: () {},
            icon: Icon(
              Icons.add_alert,
              color: accentYellow,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: accentYellow,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              child: Stack(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton.small(
                        backgroundColor: accentBrown,
                        onPressed: () {},
                        child: Icon(Icons.camera_alt),
                      ),
                      SizedBox(
                        width: 265,
                      ),
                      FloatingActionButton.small(
                        backgroundColor: accentBrown,
                        onPressed: () {},
                        child: Icon(Icons.share),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: accentYellow,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: mainGrey,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 6.0),
                        ]),
                    height: 350,
                    width: 500,
                    child: PageView(
                      children: [
                        //Indicator type A
                        TweenAnimationBuilder(
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
                                          //image로 바꿔서 ui 변화 가능.
                                          image: DecorationImage(
                                              image: Image.asset(
                                                      'assets/images/radial_scale.png')
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
                            }),
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
