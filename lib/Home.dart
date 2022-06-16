import 'package:flutter/material.dart';
import 'profile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: HomePageWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget() : super();

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        automaticallyImplyLeading: false,
        title: Align(
          alignment: AlignmentDirectional(-0.05, 0),
          child: Text(
            'DASHBOARD',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Roboto Condensed',
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        centerTitle: false,
        elevation: 2,
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                Icons.home_filled,
                color: Colors.black,
                size: 35,
              )
                  : const Icon(
                Icons.home_outlined,
                color: Colors.black,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                Icons.work_rounded,
                color: Colors.black,
                size: 35,
              )
                  : const Icon(
                Icons.work_outline_outlined,
                color: Colors.black,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                Icons.widgets_rounded,
                color: Colors.black,
                size: 35,
              )
                  : const Icon(
                Icons.widgets_outlined,
                color: Colors.black,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileWidget()),
                  );
                });
              },
              icon: pageIndex == 3
                  ? const Icon(
                Icons.person,
                color: Colors.black,
                size: 35,
              )
                  : const Icon(
                Icons.person_outline,
                color: Colors.black,
                size: 35,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFA3A3A6),
      body: SingleChildScrollView(
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF5D5D5D),
                                    offset: Offset(-2, 2),
                                    spreadRadius: 2,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.5),
                                    child: Icon(
                                      Icons.analytics_outlined,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  ),
                                  Text(
                                    'ANALYTICS',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF5D5D5D),
                                    offset: Offset(-2, 2),
                                    spreadRadius: 2,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.5),
                                    child: Icon(
                                      Icons.payment_rounded,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  ),
                                  Text(
                                    'SALES',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF5D5D5D),
                                    offset: Offset(-2, 2),
                                    spreadRadius: 2,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, -0.5),
                                    child: Icon(
                                      Icons.settings_outlined,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  ),
                                  Text(
                                    'PAYSLIPS',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF5D5D5D),
                                  offset: Offset(-2, 2),
                                  spreadRadius: 2,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, -0.5),
                                  child: Icon(
                                    Icons.leave_bags_at_home_rounded,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                                Text(
                                  'DAY OFF',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF5D5D5D),
                                  offset: Offset(-2, 2),
                                  spreadRadius: 2,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, -0.5),
                                  child: Icon(
                                    Icons.attach_money_outlined,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                                Text(
                                  'SALARY',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF5D5D5D),
                                  offset: Offset(-2, 2),
                                  spreadRadius: 2,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, -0.5),
                                  child: Icon(
                                    Icons.people_alt_rounded,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                                Text(
                                  'CUSTOMER',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
