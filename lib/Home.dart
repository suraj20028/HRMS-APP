import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Notifications.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        automaticallyImplyLeading: false,
        title: Text(
          'DASHBOARD',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Roboto Condensed',
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
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
                color: Theme.of(context).iconTheme.color,
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
                    Expanded(
                      child: Card(
                        child: SizedBox(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [Text('LEAVES LEFT :'), Text('5')],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: SizedBox(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text('PAYSLIP:'),
                              Text('10/10/2022'),
                              Text('DOWNLOAD')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        child: SizedBox(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text('DAILY CHECKIN'),
                              Text('(PUNCHING)')
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: SizedBox(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [Text('OVERTIME'), Text('3HRS')],
                          ),
                        ),
                      ),
                    ),
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
