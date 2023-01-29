import 'package:flutter/material.dart';

import '../../../palette.dart';

class WalkFAB extends StatelessWidget {
  const WalkFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'main',
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
          child: Text('data'),
        ),
      ),
      onPressed: () {},
    );
  }
}
