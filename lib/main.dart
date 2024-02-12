import 'package:flutter/material.dart';
import 'package:flutterbasic/ui_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          useMaterial3: true,
          textTheme: const TextTheme(
            headline1: TextStyle(
                color: Colors.red, fontSize: 16, fontWeight: FontWeight.w600),
            // headline2: TextStyle(
            //     color: Colors.purple,
            //     fontFamily: "protestRevolution",
            //     fontSize: 20,
            //     fontWeight: FontWeight.w500)
          )),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nameList = [
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

  String getCharater(String name) {
    return name[0];
  }

  dialog(String content) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text("Alert Dialog box"),
              content: Text(content),
              actions: [
                TextButton(
                  child: const Text(
                    "Okay",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () => Navigator.of(ctx).pop(),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text(
                'Home',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontFamily: 'protestRevolution'),
              ),
              onPressed: () => dialog("You have pressed Home button."),
            ),
            TextButton(
              child: const Text(
                'Video Conference',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () =>
                  dialog("You have pressed Video Conference button."),
            ),
            TextButton(
              child: Text(
                'Questionnaier',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontFamily: 'protestRevolution'),
              ),
              onPressed: () => dialog("You have pressed Questionnaier button."),
            ),
            TextButton(
              child: const Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => dialog("You have pressed Profile button."),
            )
          ],
        )),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 50, left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 400,
              height: 1000,
              margin: const EdgeInsets.only(bottom: 50),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(nameList[index][0]),
                    ),
                    title: Text(
                      nameList[index],
                      style: style1(),
                    ),
                    subtitle: Text(nameList[index]),
                    trailing: InkWell(
                      child: const Icon(Icons.add, color: Colors.black),
                      onTap: () => dialog("${nameList[index]}, add icon click"),
                    ),
                  );
                },
                itemCount: nameList.length,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: const Column(
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/groot.jpg")),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/asus.jpg")),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/banner.jpg")),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/groot.jpg")),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
