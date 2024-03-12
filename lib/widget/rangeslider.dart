import 'package:flutter/material.dart';

class Rangeslider extends StatefulWidget {
  const Rangeslider({super.key});

  @override
  State<Rangeslider> createState() => _RangesliderState();
}

class _RangesliderState extends State<Rangeslider> {
  RangeValues value = const RangeValues(0, 100);
  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels(value.start.toString(), value.end.toString());
    return Scaffold(
      body: Center(
          child: RangeSlider(
        values: value,
        labels: labels,
        divisions: 10,
        min: 0,
        max: 100,
        activeColor: Colors.green,
        inactiveColor: Colors.green.shade100,
        onChanged: (newValue) {
          value = newValue;
          setState(() {});
        },
      )),
    );
  }
}
