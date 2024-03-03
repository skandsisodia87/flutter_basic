import 'package:flutter/material.dart';
import 'package:flutterbasic/ui_helper.dart';
import 'package:flutterbasic/widget/roundedbtn.dart';
import 'package:flutterbasic/widget/sizebox.dart';
import 'package:intl/intl.dart';

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
          primarySwatch: Colors.red,
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
  var nameList = [];
  var username = TextEditingController();
  var selectedDate = TextEditingController();
  var currentDateTime = DateTime.now();
  var addedDateTime = [];

  handleClick() {
    setState(() {
      nameList.add(username.text);
      addedDateTime.add(DateTime.parse(selectedDate.text));
      username.clear();
    });
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
                onPressed: () =>
                    dialog("You have pressed Questionnaier button."),
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
        body: const Sizebox());
  }
}
