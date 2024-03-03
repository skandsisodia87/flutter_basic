import 'package:flutter/material.dart';

class StackView extends StatelessWidget {
  const StackView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: Stack(
        // alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: const Text('You'),
          ),
          // Container(
          //   width: 90,
          //   height: 90,
          //   color: Colors.green,
          //   child: const Text('We'),
          // ),
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              width: 90,
              height: 90,
              color: const Color.fromARGB(255, 183, 215, 23),
              child: const Text('We'),
            ),
          ),
        ],
      ),
    );
  }
}
