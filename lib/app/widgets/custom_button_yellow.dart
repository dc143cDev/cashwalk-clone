import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

class CustomButtonYellow extends StatelessWidget {
  const CustomButtonYellow({Key? key, this.onPressed, this.btnText})
      : super(key: key);

  final Function()? onPressed;
  final String? btnText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(accentYellow),
        padding:
            MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(8.0)),
        foregroundColor: MaterialStateProperty.all<Color>(accentYellow),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: accentYellow, width: 3.0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          btnText!,
          style: TextStyle(
            fontFamily: 'IBMKR',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
