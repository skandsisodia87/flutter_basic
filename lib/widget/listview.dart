import 'package:flutter/material.dart';

class Listbuilder extends StatelessWidget {
  Listbuilder({super.key});

  final nameList = [
    "Ayush",
    "Skand",
    "Tushar",
    "Shubh",
    "Pulkit",
    "Rahul",
    "Sachin",
    "Rohit",
    "Shiv",
    "Piyush"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            // color: Colors.brown[400],
            child: Container(
              color: Colors.brown[400],
              child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.only(right: 10, left: 10),
                  child: CircleAvatar(
                    child: Text(nameList[index][0]),
                  ),
                ),
                itemCount: 8,
                // separatorBuilder: (context, index) => Container(
                //   width: 5,
                // ),
                scrollDirection: Axis.horizontal,
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            flex: 6,
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(right: 14, bottom: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                        child: Text(
                      nameList[index][0],
                      style: const TextStyle(fontFamily: 'protestRevolution'),
                    )),
                    title: Text(
                      nameList[index],
                      style: const TextStyle(fontFamily: 'protestRevolution'),
                    ),
                    subtitle: Text(
                      "Hello ${nameList[index]}",
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        print("Delete btn Clicked");
                      },
                    ),
                  ),
                ),
                itemCount: nameList.length,
              ),
            )),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
