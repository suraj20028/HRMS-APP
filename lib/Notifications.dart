import 'package:flutter/material.dart';

class notify extends StatefulWidget {
  const notify({Key? key}) : super(key: key);

  @override
  State<notify> createState() => _notifyState();
}

class _notifyState extends State<notify> {
  final List<String> time = <String>['8:00am', '12:00pm', '1:00pm'];
  final List<String> head = <String>['PAYSLIP', 'ATTENDANCE', 'MEET'];
  final List<String> det = <String>['This month updates on payslip has been issued ',
    'Mark your attendance before it gets timed out', 'Please join the meeting at 4:00 PM'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'NOTIFICATIONS',
        ),
        centerTitle: true,
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
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
                      head[index],
                      style: Theme.of(context).textTheme.subtitle1,
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
                      det[index],
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
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: Text(
                            time[index],
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.black,
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
