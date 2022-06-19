import 'package:flutter/material.dart';
import 'package:hrms/login.dart';

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
      home: LoginPage(),
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
            subtitle1: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            subtitle2: TextStyle(
              //fontFamily: 'Lexend Deca',
              color: Color(0xFF95A1AC),
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
          appBarTheme: AppBarTheme(
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto Condensed',
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ))),
      debugShowCheckedModeBanner: false,
    );
  }
}
