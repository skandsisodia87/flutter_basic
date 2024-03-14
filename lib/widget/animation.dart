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

class OpacityAnimation extends StatefulWidget {
  const OpacityAnimation({super.key});

  @override
  State<OpacityAnimation> createState() => OpacityAnimationState();
}

class OpacityAnimationState extends State<OpacityAnimation> {
  var _opacity = 1.0;
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            duration: const Duration(seconds: 2),
            curve: Curves.bounceInOut,
            opacity: _opacity,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                if (flag) {
                  _opacity = 0.3;
                } else {
                  _opacity = 1.0;
                }
                setState(() {
                  flag = !flag;
                });
              },
              child: const Text("Animate"))
        ],
      ),
    );
  }
}
