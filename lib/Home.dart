// ignore: file_names
import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hrms/checkin.dart';
import 'package:hrms/tile.dart';
import 'Notifications.dart';
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
    "login": "hradmin@gmail.com",
    "password": "hradmin@123"
  };

    final response = await http.post(
        Uri.parse('https://hrmsprime.com/app_list_employees'),
        body: convert.jsonEncode(jsonMap),
        headers: {"Content-type": "application/json"});

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
      return Employee.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
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
                    MaterialPageRoute(builder: (context) => const notify()));
              },
              icon: Icon(
                Icons.notifications,
              ))
        ],
      ),
      body: FutureBuilder<Employee>(
        future: futureAlbum,
        builder: (context, snapshot) {
          print(snapshot.data?.eadd);
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
                            //Text('phone:1234567890'),
                            Text('designation:employee'),
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
                          Tile(
                              title: 'LEAVES LEFT',
                              description: snapshot.data!.eleft.toString()),
                          Tile(
                              title: 'PAY SLIP',
                              description: snapshot.data!.epdate.toString()),
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
                          Tile(title: 'OVERTIME', description: '3HRS'),
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
