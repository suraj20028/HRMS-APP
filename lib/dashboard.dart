import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hrms/Home.dart';
import 'package:hrms/main.dart';
import 'package:intl/intl.dart';
import 'login.dart';
import 'tile.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  bool check = false;
  var time_in = '';
  var time_out = '';
  var txt = 'CHECKIN';
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Color.fromARGB(255, 242, 124, 34),
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
        automaticallyImplyLeading: false,
        title: Text(
          'Dashboard',
        ),
        centerTitle: false,
        elevation: 2,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.power_settings_new)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 242, 124, 34)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(10), //add border radius here
                    child: Image(
                      image: AssetImage('assets/pic.png'),
                      height: 100.0,
                      width: 100.0,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'XXX',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('trainee'),
                      Text('xzz@gmail.com'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('In time',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        time_in,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: check
                      ? null
                      : () {
                          setState(() {
                            if (txt == 'CHECKOUT') {
                              check = true;
                              time_out = DateFormat("hh:mm:ss a")
                                  .format(DateTime.now());
                            }
                            time_in =
                                DateFormat("hh:mm:ss a").format(DateTime.now());
                            txt = 'CHECKOUT';
                          });
                        },
                  child: Text(txt),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Out time',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        time_out,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                makeDashboardItem("PROFILE", Icons.face_outlined),
                makeDashboardItem("PAYSLIPS", Icons.payment_outlined),
              ],
            ),
            Row(
              children: [
                makeDashboardItem("APPLY LEAVE", Icons.calendar_month),
                makeDashboardItem("CONTACT", Icons.call_end),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget makeDashboardItem(String name, IconData icon) {
  return Expanded(
    child: Card(
      child: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
                child: Icon(
              icon,
              size: 40.0,
              color: Colors.black,
            )),
            SizedBox(height: 20.0),
            Center(
              child: Text(name,
                  style: TextStyle(fontSize: 18.0, color: Colors.black)),
            )
          ],
        ),
      ),
    ),
  );
}
