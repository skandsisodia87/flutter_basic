import 'package:flutter/material.dart';

class WrapWidget extends StatelessWidget {
  const WrapWidget({super.key});

  @override
  Widget build(Object context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 400,
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          // direction: Axis.vertical,
          alignment: WrapAlignment.spaceEvenly,
          children: [
            Container(
              width: 40,
              height: 40,
              color: Colors.red,
              child: const Text('You'),
            ),
            Container(
              width: 40,
              height: 40,
              color: Colors.green,
              child: const Text('We'),
            ),
            Container(
              width: 40,
              height: 40,
              color: Colors.brown,
              child: const Text('They'),
            ),
            Container(
              width: 40,
              height: 40,
              color: Colors.orange,
              child: const Text('It'),
            ),
            Container(
              width: 40,
              height: 40,
              color: Colors.blue,
              child: const Text('Who'),
            ),
            Container(
              width: 40,
              height: 40,
              color: Colors.brown,
              child: const Text('He'),
            ),
            Container(
              width: 40,
              height: 40,
              color: Colors.yellow,
              child: const Text('She'),
            )
          ],
        ),
      ),
    );
  }
}
