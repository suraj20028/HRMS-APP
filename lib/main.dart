import 'package:flutter/material.dart';
import 'package:hrms/applyleave.dart';
import 'package:hrms/login.dart';
import 'package:hrms/pallete.dart';
import 'package:hrms/profile.dart';
import 'package:hrms/employee.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'Home.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmployeeLogin(),
      theme: ThemeData(
          iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
          backgroundColor: Color.fromARGB(255, 236, 236, 236),
          primarySwatch: Palette.kToDark,
          brightness: Brightness.light,
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
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
              backgroundColor: Color.fromARGB(255, 26, 67, 106),
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto Condensed',
                fontSize: 25,
                fontWeight: FontWeight.w800,
              )),
          buttonTheme: ButtonThemeData(
            buttonColor: Color.fromARGB(255, 26, 67, 106),
            padding: EdgeInsets.all(25),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
