import 'package:flutter/material.dart';

class ListWheelView extends StatefulWidget {
  const ListWheelView({super.key});

  @override
  State<ListWheelView> createState() => _ListWheelViewState();
}

class _ListWheelViewState extends State<ListWheelView> {
  var items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
        itemExtent: 100,
        children: items
            .map((e) => Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    child: Center(
                        child: Text(
                      '$e',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    )),
                  ),
                ))
            .toList());
  }
}
