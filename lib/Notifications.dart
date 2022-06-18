import 'package:flutter/material.dart';
import 'package:hrms/main.dart';
import 'Home.dart';

class notify extends StatefulWidget {
  const notify({Key? key}) : super(key: key);

  @override
  State<notify> createState() => _notifyState();
}

class _notifyState extends State<notify> {
  final List<String> time = <String>['8:00am', '12:00pm', '1:00pm'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        automaticallyImplyLeading: false,
        title: Text(
          'NOTIFICATIONS',
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
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Home()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 25.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PAYSLIPS',
                      style: TextStyle(
                        color: Color(0xFF4B39EF),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 1,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 195, 198, 202),
                      ),
                      margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
                    ),
                    Text(
                      'Charity 5K Race for a Cure',
                      style: TextStyle(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF090F13),
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Short description goes here and can be more\nthan one line. Two lines is the best length… ',
                      style: TextStyle(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF95A1AC),
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                          child: Icon(
                            Icons.schedule,
                            color: Color(0xFF4B39EF),
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: Text(
                            '${time[index]}',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF4B39EF),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
