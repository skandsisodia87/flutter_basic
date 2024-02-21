import 'package:flutter/material.dart';

class Roundbutton extends StatelessWidget {
  final String btnName;
  final Icon? icon;
  final Color? bgColor;
  final Color? iconColor;
  final TextStyle? textStyle;
  final VoidCallback? callback;

  const Roundbutton(
      {required this.btnName,
      this.icon,
      this.iconColor,
      this.bgColor = Colors.blue,
      this.textStyle,
      required this.callback,
      super.key});

  @override
  Widget build(Object context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)))),
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon!,
                Text(
                  btnName,
                  style: textStyle,
                ),
              ],
            )
          : Text(
              btnName,
              style: textStyle,
            ),
    );
  }
}
