import 'dart:math';

import 'package:flutter/material.dart';

class DragableWidget extends StatefulWidget {
  const DragableWidget({super.key});
  @override
  State<DragableWidget> createState() => DragableWidgetState();
}

class DragableWidgetState extends State<DragableWidget> {
  var left = 0.0;
  var top = 0.0;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        left: left,
        top: top,
        child: GestureDetector(
          onPanUpdate: (data) {
            left = max(0.0, left + data.delta.dx);
            top = max(0.0, top + data.delta.dy);
            setState(() {});
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: const Center(
              child: Text(
                "Skand",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
