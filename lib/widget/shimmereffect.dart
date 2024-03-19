import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatefulWidget {
  const ShimmerEffect({super.key});

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> {
  bool _enable = true;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      setState(() {
        _enable = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
              child: Text(
            "Shimmer Effect",
            style: TextStyle(color: Colors.white),
          )),
        ),
        body: Column(mainAxisSize: MainAxisSize.max, children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                if (_enable) {
                  return Shimmer.fromColors(
                    enabled: _enable,
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.lightBlue,
                        child: Text('$index'),
                      ),
                      title: Container(
                        color: Colors.white,
                        height: 10,
                        width: 100,
                      ),
                      subtitle: Container(
                        color: Colors.white,
                        height: 10,
                        width: 80,
                      ),
                      trailing: Container(
                        color: Colors.white,
                        height: 26,
                        width: 26,
                      ),
                    ),
                  );
                } else {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightBlue,
                      child: Text(
                        '$index',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      "Skand Sisodia",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    subtitle: Text(
                      "Here we are using shimmer effect",
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                    trailing: const Icon(
                      Icons.add_a_photo,
                      color: Colors.lightBlue,
                    ),
                  );
                }
              },
            ),
          ),
        ]));
  }
}
