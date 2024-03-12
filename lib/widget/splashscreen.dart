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

    Timer(const Duration(seconds: 2), () {
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
        color: Colors.blue,
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
