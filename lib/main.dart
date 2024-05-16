import 'package:flutter/material.dart';
import 'package:flutterbasic/routes/routes.dart';
import 'package:flutterbasic/ui_helper.dart';
// import 'package:flutterbasic/widget/listview.dart';
import 'package:flutterbasic/widget/roundedbtn.dart';
// import 'package:flutterbasic/widget/splashscreen.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = goRouter();
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: const TextTheme(
            // ignore: deprecated_member_use
            headline1: TextStyle(
                color: Colors.red, fontSize: 16, fontWeight: FontWeight.w600),
            // headline2: TextStyle(
            //     color: Colors.purple,
            //     fontFamily: "protestRevolution",
            //     fontSize: 20,
            //     fontWeight: FontWeight.w500)
          )),
      // home: const SplashScreen(),
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
  static const String KEYNAME = "Username";
  late String savedValue;
  var nameList = [];
  var username = TextEditingController();
  var selectedDate = TextEditingController();
  var currentDateTime = DateTime.now();
  var addedDateTime = [];

  handleClick() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(KEYNAME, username.text);
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
                SizedBox(
                  width: 80,
                  child: TextButton(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.ghost,
                          size: 16,
                          color: Colors.red,
                          semanticLabel: AutofillHints.birthday,
                        ),
                        Text(
                          " Okay",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    onPressed: () => Navigator.of(ctx).pop(),
                  ),
                )
              ],
            ));
  }

  @override
  void initState() {
    super.initState();

    setValueInSharePref();
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
              child: RichText(
                  text: const TextSpan(children: <TextSpan>[
                TextSpan(text: "Video", style: TextStyle(color: Colors.blue)),
                TextSpan(
                    text: "Conference", style: TextStyle(color: Colors.white))
              ])),
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
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Listbuilder(),
                //     ));
                context.goNamed(AppRoute.list.name);
              },
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
                        subtitle: Text(
                            // DateFormat('yMMMMEEEEd').format(DateTime.now())),
                            DateFormat().format(addedDateTime[index])),
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
                              cursorColor: Colors.black,
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
                                      borderSide: const BorderSide(width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: selectedDate,
                              onTap: () async {
                                DateTime? dateTime = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(2023),
                                    lastDate: DateTime(2025),
                                    initialDate: DateTime.now());

                                if (dateTime != null) {
                                  selectedDate.text = dateTime.toString();
                                }
                              },
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "mm/dd/yyyy",
                                  prefixIcon: const Icon(Icons.calendar_month),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 1)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 180,
                              child: Roundbutton(
                                btnName: "Submit",
                                callback: handleClick,
                                bgColor: Colors.brown[200],
                                icon: const Icon(
                                  Icons.heart_broken_outlined,
                                  color: Colors.brown,
                                ),
                                textStyle: style1(),
                              ),
                            )
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

  void setValueInSharePref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var newValue = sharedPreferences.getString(KEYNAME);
    print(newValue);
    savedValue = newValue ?? "No Saved value";
  }
}
