import 'package:flutter/material.dart';
import 'package:hrms/reset.dart';
import 'Home.dart';
import 'forgot.dart';

class Employee extends StatelessWidget {
  Employee({Key? key}) : super(key: key);

  final eidc = TextEditingController();
  final epass = TextEditingController();

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Color.fromARGB(255, 242, 124, 34),
    minimumSize: Size(300, 60),
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
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'EMPLOYEE',
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
                  child: Image.asset('assets/icon-removebg-preview.png')),
            ),
            Padding(padding: const EdgeInsets.all(20)),
            Padding(
              padding: const EdgeInsets.all(1),
             
              child: Align(
              alignment: Alignment.topLeft,
              child: Text(' Login',style: TextStyle(
                  fontSize: 20,
                  
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),),
            ),),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: eidc,
                decoration: InputDecoration(

                    
                    labelText: 'Employee ID',
                    suffixIcon : CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 250, 250, 250),
                       child : CircleAvatar(
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
                  suffixIcon : CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 250, 250, 250),
                       child : CircleAvatar(
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
              child:Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Forgot(),),);
                      }),
                      child: Text('  Forgot password?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                      )),
                    ),
                  ),
                  
                ],
              )
            ),
            Padding(padding: const EdgeInsets.all(12)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: raisedButtonStyle,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        eid: eidc.text,
                        pass: epass.text,
                      ),
                    ),
                  );
                },
                child: Text('Login',
                style: TextStyle(
                color:Colors.white,
                ),
              ),
            ),
            ),
          ],
        ),
      )),
    );
  }
}
