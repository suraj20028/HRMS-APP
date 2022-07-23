import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hrms/applyleave.dart';
import 'package:hrms/contacts.dart';
import 'package:hrms/employeeLogin.dart';
import 'package:hrms/payslip.dart';
import 'package:hrms/profile.dart';
import 'package:intl/intl.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  late String base64 = "";
  late Uint8List bytes;
  late String image = "";
  var storage = FlutterSecureStorage();
  var lat = 0.0;
  var lon = 0.0;
  var _cad = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _determinePosition();
    });
  }

  timer() {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => dashboard()));
    });
  }

  Future<Map<String, dynamic>> fetchAlbum() async {
    bool trylog = false;
    var session = await storage.read(key: 'cookie');
    //print(session);
    final response = await http.get(
        Uri.parse(
            'https://hrmsprime.com/my_services_api/partner/get_dashboard_details'),
        headers: {"Cookie": session.toString()});
    //print(response.body);
    if (response.statusCode == 200) {
      bool flag = false;
      var det = jsonDecode(response.body)['employees_list'][0];
      base64 = jsonDecode(response.body)['employees_list'][0]['employee_photo']
          .toString();
      image = base64.substring(2, base64.length - 1);
      bytes = Base64Codec().decode(image);
      storage.write(key: 'pic', value: image);
      return det;
    }

    return Map();
  }

  bool check = false;
  var time_in = '';
  var time_out = '';
  var txt = 'CHECKIN';
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Color.fromARGB(255, 26, 67, 106),
    padding: EdgeInsets.all(25),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      //print(placemarks);
      Placemark place = placemarks[0];

      setState(() {
        _cad = "${place.subLocality},${place.thoroughfare}";
      });
    } catch (e) {
      print(e);
    }
  }

  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      print('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        print('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      print(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    Geolocator.getCurrentPosition().then((value) {
      setState(() {
        lat = value.latitude;
        lon = value.longitude;
      });
      _getAddressFromLatLng();
    });
    //print(await Geolocator.getCurrentPosition());
  }

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
        centerTitle: true,
        elevation: 2,
        leading: Image(image: AssetImage('assets/bg_rem.png')),
        actions: [
          IconButton(
              onPressed: () {
                storage.deleteAll();
                Navigator.pop(context, true);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => login(),
                    ));
              },
              icon: Icon(Icons.power_settings_new)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: FutureBuilder<Map<String, dynamic>>(
                future: fetchAlbum(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //print(jsonDecode(snapshot.data.toString()));
                    return Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(
                                10), //add border radius here
                            child: Image.memory(
                              bytes,
                              height: 100,
                              width: 100,
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!['id'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              snapshot.data!['name'],
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              snapshot.data!['job_title '],
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(snapshot.data!['work_email'],
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat.yMMMd().format(DateTime.now())),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            _cad,
                            style: TextStyle(overflow: TextOverflow.visible),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              height: 10,
              thickness: 2,
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
                  onPressed: () {
                    setState(
                      () {
                        if (txt == 'CHECKOUT') {
                          time_out =
                              DateFormat("hh:mm:ss a").format(DateTime.now());
                          txt = 'CHECKIN';
                        } else if (txt == 'CHECKIN') {
                          time_in =
                              DateFormat("hh:mm:ss a").format(DateTime.now());
                          txt = 'CHECKOUT';
                        }
                      },
                    );
                  },
                  child: Text(txt, style: TextStyle(color: Colors.white)),
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
            Divider(
              indent: 20,
              endIndent: 20,
              height: 10,
              thickness: 2,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                makeDashboardItem("PROFILE", Icons.person, Profile(), context),
                makeDashboardItem(
                    "PAYSLIPS", Icons.payment_outlined, payslip(), context),
              ],
            ),
            Row(
              children: [
                makeDashboardItem(
                    "APPLY LEAVE", Icons.calendar_month, ApplyLeave(), context),
                makeDashboardItem(
                    "CONTACT", Icons.call_end, Contact(), context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget makeDashboardItem(
    String name, IconData icon, Widget wid, BuildContext context) {
  return Expanded(
    child: InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => wid,
          )),
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
    ),
  );
}
