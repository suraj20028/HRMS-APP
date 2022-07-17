import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/employee.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Color.fromARGB(255, 242, 124, 34),
    minimumSize: Size(300, 60),
    padding: EdgeInsets.all(25),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          iconTheme: Theme.of(context).appBarTheme.iconTheme,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          automaticallyImplyLeading: false,
          title: Text(
            'HRMS',
          ),
          centerTitle: true,
          elevation: 2,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/profile.jpg')),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  'Select your role',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {},
                child: Text('Business Owner/Admin/HR'),
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmployeeLogin(),
                      ),
                    );
                  },
                  child: Text('Employee'),
                ),
              )
            ],
          ),
        ));
  }
}
