import 'package:flutter/material.dart';

class Sizebox extends StatelessWidget {
  const Sizebox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 40,
          width: 100,
          child: ElevatedButton(
            child: const Text('Submit'),
            onPressed: () {},
          ),
        ),
        const SizedBox(
          height: 10,
          width: 10,
        ),
        SizedBox.square(
          dimension: 100,
          child: ElevatedButton(
            child: const Text('close'),
            onPressed: () {},
          ),
        ),
        ConstrainedBox(
            constraints: const BoxConstraints(
                maxHeight: 80, minHeight: 40, minWidth: 40, maxWidth: 80),
            child: SizedBox.expand(
              // SizedBox.shrink takes min dimension of the parent
              child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {},
              ),
            ))
      ],
    );
  }
}
