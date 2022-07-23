import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dashboard.dart';
import 'forgot.dart';
import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final eidc = TextEditingController();
  final epass = TextEditingController();
  final storage = FlutterSecureStorage();
  Map<String, String> headers = {};
  bool trylog = false;
  timer() {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pop(context, true);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => dashboard()));
    });
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Color.fromARGB(255, 242, 124, 34),
    minimumSize: Size(300, 60),
    padding: EdgeInsets.all(25),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  Future<int> fetchAlbum(BuildContext context) async {
    var check = '';
    Map<String, dynamic> jsonMap = {
      "login": eidc.text,
      "password": epass.text,
    };
    final response = await http.post(
        Uri.parse('https://hrmsprime.com/session/auth/login'),
        body: jsonEncode(jsonMap),
        headers: {"Content-type": "application/json"});
    //print(response.body);

    if (response.statusCode == 200) {
      bool flag = false;

      String? rawCookie = response.headers['set-cookie'];
      if (rawCookie != null) {
        int index = rawCookie.indexOf(';');
        headers['cookie'] =
            (index == -1) ? rawCookie : rawCookie.substring(0, index);
      }
      await storage.write(key: 'cookie', value: headers['cookie']);
      //print(await storage.read(key: 'employee'));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('LOGIN SUCCESFULL'),
      ));
      return 1;
    } else if (response.statusCode == 403) {
      setState(() {
        trylog = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('INVALID CREDENTIALS')));
      });
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
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
                  FutureBuilder<int>(
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data == 1) {
                          timer();
                        }
                        return Text('');
                      } else if (snapshot.hasError) {
                        return Center(child: Text('${snapshot.error}'));
                      }

                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                    future: fetchAlbum(context),
                  )
              ],
            ),
          )),
    );
  }
}
