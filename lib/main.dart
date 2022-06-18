import 'package:flutter/material.dart';

import 'Home.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color.fromARGB(255, 50, 53, 57),
          brightness: Brightness.light,
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
            bodyText1: TextStyle(color: Colors.black),
            subtitle1: TextStyle(color: Color(0xFF4B39EF)),
          ),
          appBarTheme:
              AppBarTheme(backgroundColor: Color.fromARGB(255, 0, 91, 195))),
      debugShowCheckedModeBanner: false,
    );
  }
}
