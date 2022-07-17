import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hrms/apiCall.dart';
import 'package:hrms/dashboard.dart';
import 'package:toast/toast.dart';
import 'forgot.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EmployeeLogin extends StatefulWidget {
  EmployeeLogin({Key? key}) : super(key: key);

  @override
  State<EmployeeLogin> createState() => _EmployeeLoginState();
}

class _EmployeeLoginState extends State<EmployeeLogin> {
  final eidc = TextEditingController();
  final storage = FlutterSecureStorage();

  timer() {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => dashboard()));
    });
  }

  final epass = TextEditingController();

  bool trylog = false;

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<Employee> fetchAlbum() async {
    Map<String, dynamic> jsonMap = {
      "login": eidc.text,
      "password": epass.text,
    };
    final response = await http.post(
        Uri.parse('https://hrmsprime.com/app_list_employees'),
        body: jsonEncode(jsonMap),
        headers: {"Content-type": "application/json"});

    if (response.statusCode == 200) {
      bool flag = false;
      //print(jsonDecode(response.body));
      if (jsonDecode(response.body)['result']['error'] ==
              "Login/Password is not set" ||
          jsonDecode(response.body)['result']['status'] == "Access denied!") {
        flag = true;
      }
      var emp;
      if (flag) {
        //print(jsonDecode(response.body)['result']['employee_list']);
        //Fluttertoast.showToast(msg: 'Invalid Credentials');
        setState(() {
          trylog = false;
        });
      } else {
        var jsonvals = jsonDecode(response.body)['result']['employees_list'][0];
        emp = Employee.fromJson(jsonvals);

        await storage.write(key: 'employee', value: jsonEncode(jsonvals));
        //print(await storage.read(key: 'employee'));
        return emp;
      }
      if (emp == null) {
        throw Exception('Failed to load Employee details');
      }
      return emp;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Employee details');
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'LOGIN',
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                      width: 200,
                      height: 175,
                      child: Image.asset('assets/Blue-circle.png')),
                ),
                Padding(padding: const EdgeInsets.all(20)),
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      ' Login',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: eidc,
                    decoration: InputDecoration(
                      labelText: 'Employee ID',
                      suffixIcon: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 250, 250, 250),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffE6E6E6),
                          radius: 2,
                          child: Icon(
                            Icons.person,
                            color: Color(0xffCCCCCC),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    controller: epass,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 250, 250, 250),
                        child: CircleAvatar(
                          backgroundColor: Color(0xffE6E6E6),
                          radius: 2,
                          child: Icon(
                            Icons.lock,
                            color: Color(0xffCCCCCC),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(2),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Forgot(),
                                ),
                              );
                            }),
                            child: Text('  Forgot password?',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                )),
                          ),
                        ),
                      ],
                    )),
                Padding(padding: const EdgeInsets.all(12)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.black87,
                      minimumSize: Size(300, 60),
                      padding: EdgeInsets.all(25),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                    ),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      setState(() {
                        trylog = true;
                      });
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                if (trylog)
                  FutureBuilder<Employee>(
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        timer();
                        return Text('');
                      } else if (snapshot.hasError) {
                        return Center(child: Text('${snapshot.error}'));
                      }

                      // By default, show a loading spinner.
                      return Center(child: const CircularProgressIndicator());
                    },
                    future: fetchAlbum(),
                  )
              ],
            ),
          )),
    );
  }
}
