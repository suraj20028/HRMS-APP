// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hrms/checkin.dart';
import 'package:hrms/tile.dart';
import 'Notifications.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

import 'apiCall.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<List<Employee>> getEmployeeList() async {
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('rakhulant:1234'));
    final response = await http.get(
        Uri.parse(
            'https://secret-island-08960.herokuapp.com/employees/hrms143/?format=json'),
        headers: <String, String>{'authorization': basicAuth});
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Employee> employees = items.map<Employee>((json) {
      return Employee.fromJson(json);
    }).toList();

    return employees;
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
      body: FutureBuilder(
        future: getEmployeeList(),
        builder: (context, snapshot) {
          var dat = jsonDecode(jsonEncode(snapshot.data.toString()));
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
                              'Employeeid:10928',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Name:Sai Ganesh'),
                            Text("address:${dat[dat.indexOf('address')]}"),
                            Text('phone:1234567890'),
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
                          Tile(title: 'LEAVES LEFT', description: '5'),
                          Tile(title: 'PAY SLIP', description: '10/10/2022'),
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
