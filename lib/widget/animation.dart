import 'package:flutter/material.dart';

class BoxAnimation extends StatefulWidget {
  const BoxAnimation({super.key});

  @override
  State<BoxAnimation> createState() => _BoxAnimationState();
}

class _BoxAnimationState extends State<BoxAnimation> {
  var _height = 100.0;
  var _width = 100.0;
  bool flag = true;
  Color bgcolor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
                color: bgcolor, borderRadius: BorderRadius.circular(12)),
            duration: const Duration(seconds: 2),
            curve: Curves.bounceInOut,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                if (flag) {
                  _height = 200.0;
                  _width = 50.0;
                  bgcolor = Colors.green;
                } else {
                  _height = 100.0;
                  _width = 100.0;
                  bgcolor = Colors.red;
                }
                flag = !flag;
                setState(() {});
              },
              child: const Text("Animate"))
        ],
      ),
    );
  }
}
