import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms/checkin.dart';
import 'package:hrms/tile.dart';
import 'Notifications.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      body: SafeArea(
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
                      Text('email:saiganesh@company.com'),
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
                      child: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CheckinPage())),
                          child: Tile(
                              title: 'DAILY CHECKIN',
                              description: 'Click Here')),
                    ),
                    Tile(title: 'OVERTIME', description: '3HRS'),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
