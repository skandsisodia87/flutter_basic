import 'package:flutter/material.dart';

class Gridcount extends StatelessWidget {
  const Gridcount({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 4,
      children: [
        Container(
          height: 10,
          width: 10,
          color: Colors.red,
        ),
        Container(
          height: 10,
          width: 10,
          color: Colors.green,
        ),
        Container(
          height: 10,
          width: 10,
          color: Colors.yellow,
        ),
        Container(
          height: 10,
          width: 10,
          color: Colors.orange,
        ),
        Container(
          height: 10,
          width: 10,
          color: Colors.brown,
        ),
        Container(
          height: 10,
          width: 10,
          color: Colors.purple,
        ),
        Container(
          height: 10,
          width: 10,
          color: Colors.blue,
        ),
      ],
    );
  }
}

class Gridextent extends StatelessWidget {
  const Gridextent({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      maxCrossAxisExtent: 70,
      children: [
        Container(
          height: 10,
          width: 10,
          color: Colors.red,
        ),
        Container(
          height: 10,
          width: 10,
          color: Colors.green,
        ),
        Container(
          height: 10,
          width: 10,
          color: Colors.yellow,
        ),
        Container(
          height: 10,
          width: 10,
          color: Colors.orange,
        ),
        Container(
          height: 10,
          width: 10,
          color: Colors.brown,
        ),
        Container(
          height: 10,
          width: 10,
          color: Colors.purple,
        ),
        Container(
          height: 10,
          width: 10,
          color: Colors.blue,
        ),
      ],
    );
  }
}

class GridBuilder extends StatelessWidget {
  GridBuilder({super.key});

  final colours = [
    Colors.red,
    Colors.yellow,
    Colors.pink,
    Colors.green,
    Colors.orange,
    Colors.blue,
    Colors.purple,
    Colors.grey,
    Colors.brown,
    Colors.indigo,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Container(
          height: 10,
          width: 10,
          color: colours[index],
        );
      },
      itemCount: 5,
    );
  }
}
