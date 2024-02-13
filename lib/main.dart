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

  var username = TextEditingController();

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
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Card(
                      elevation: 2,
                      shadowColor: Colors.brown[300],
                      color: Colors.brown[300],
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.brown[200],
                          child: Text(
                            nameList[index][0],
                            style: style2(),
                          ),
                        ),
                        title: Text(
                          nameList[index],
                          style: style1(),
                        ),
                        subtitle: Text(nameList[index]),
                        trailing: IconButton(
                          onPressed: () => dialog("Add button pressed"),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        width: 300,
                        child: Column(
                          children: [
                            TextField(
                              controller: username,
                              cursorColor: Colors.red,
                              // enabled: false,
                              // obscureText: true, //hide text
                              // obscuringCharacter: '*',
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "Enter your name",
                                  prefixIcon: const Icon(Icons.person),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 1)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  var name = username.text;
                                  dialog("Hi, $name");
                                },
                                child: const Text("Submit"))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 200,
                        width: 200,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/asus.jpg")),
                        ),
                      ),
                      const SizedBox(
                        height: 200,
                        width: 200,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/banner.jpg")),
                        ),
                      ),
                      const SizedBox(
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
