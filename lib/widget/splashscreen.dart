import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterbasic/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => IconScreen();
}

class IconScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const MyHomePage(title: 'Flutter Demo Home Page'),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //     // colors: [Colors.red, Colors.blue, Colors.purple],
            //     colors: [Color(0xfffbc2eb), Color(0xffa6c1ee)],
            //     begin: FractionalOffset(1.0, 0.0),
            //     end: FractionalOffset(0.0, 1.0))
            gradient: RadialGradient(
                colors: [Color(0xfff6d365), Color(0xfffda085)],
                stops: [0.5, 1.0],
                center: Alignment.bottomCenter)),
        child: const Center(
          child: Text(
            "CLASSICO",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'protestRevolution',
                fontSize: 26),
          ),
        ),
      ),
    );
  }
}
