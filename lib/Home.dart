// ignore: file_names
import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hrms/checkin.dart';
import 'package:hrms/dashboard.dart';
import 'package:hrms/payslip.dart';
import 'package:hrms/profile.dart';
import 'package:hrms/tile.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

import 'apiCall.dart';

class HomePage extends StatefulWidget {
  final String eid;
  final String pass;
  const HomePage({Key? key, required this.eid, required this.pass})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Employee> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  Future<Employee> fetchAlbum() async {
    Map<String, dynamic> jsonMap = {
      "login": widget.eid,
      "password": widget.pass
    };

    final response = await http.post(
        Uri.parse('https://hrmsprime.com/app_list_employees'),
        body: convert.jsonEncode(jsonMap),
        headers: {"Content-type": "application/json"});

    if (response.statusCode == 200) {
      bool flag = false;

      if (jsonDecode(response.body)['result']['error'] ==
              "Login/Password is not set" ||
          jsonDecode(response.body)['result']['error'] == "Access denied!") {
        flag = true;
      }
      ;

      if (flag) {
        //print(jsonDecode(response.body)['result']['employee_list']);
        throw Exception('Failed to load Employee details');
      }

      var emp = Employee.fromJson(
          jsonDecode(response.body)['result']['employees_list'][0]);

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

  String extract(String url) {
    return url.substring(52, 59);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        automaticallyImplyLeading: false,
        title: Text(
          'DASHBOARD',
        ),
        centerTitle: true,
        elevation: 2,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const payslip()));
              },
              icon: Icon(
                Icons.notifications,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              icon: Icon(
                Icons.face,
              ))
        ],
      ),
      body: FutureBuilder<Employee>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Card(
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 25.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Employeeid:${snapshot.data!.id}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Name:${snapshot.data!.name}'),
                            Text("address:${snapshot.data!.workEmail}"),
                            Text('phone:${snapshot.data!.workMobile}'),
                            Text('designation:${snapshot.data!.jobTitle}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Tile(title: 'ID', description: snapshot.data!.idNo),
                          Tile(
                              title: 'Joined ',
                              description: snapshot.data!.joinDate),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CheckinPage())),
                                child: Row(
                                  children: [
                                    Tile(
                                        title: 'DAILY CHECKIN',
                                        description: 'Click Here'),
                                  ],
                                )),
                          ),
                          Expanded(
                            child: GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CheckinPage())),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const dashboard())),
                                          child: Row(
                                            children: [
                                              Tile(
                                                  title: 'DEPT NAME',
                                                  description:
                                                      snapshot.data!.deptName),
                                            ],
                                          )),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
