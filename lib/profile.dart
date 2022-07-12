import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/icon.png'),
                ),
                Text(
                  'Srinivaaaaaasa',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontWeight:FontWeight.bold ,
                    fontSize: 25,
                  ),
          
                ),
                Text(
                  '007',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 20,
                  ),
                ),
                Text(
                  'manager',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 25,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5),),
                Divider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(padding: EdgeInsets.all(5),),
                ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration : BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(8)),
                      child: Icon(Icons.face_outlined,)),
                    title: Text('personal'),
                    trailing: Icon(Icons.navigate_next),
                ),
                ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration : BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(8)),
                      child: Icon(Icons.work,)),
                    title: Text('Work'),
                    trailing: Icon(Icons.navigate_next),
                ),
                ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration : BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(8)),
                      child: Icon(Icons.privacy_tip_outlined,)),
                    title: Text('privacy & terms'),
                    trailing: Icon(Icons.navigate_next),
                ),
                ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration : BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(8)),
                      child: Icon(Icons.lock,)),
                    title: Text('Security'),
                    trailing: Icon(Icons.navigate_next),
                ),
                Padding(padding: EdgeInsets.all(5),),
                Divider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(padding: EdgeInsets.all(5),),
                ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration : BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(8)),
                      child: Icon(Icons.headphones)),
                    title: Text('Support'),
                    trailing: Icon(Icons.navigate_next),
                ),
                Padding(padding: EdgeInsets.all(5),),
                Divider(
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                Padding(padding: EdgeInsets.all(5),),
              
              ElevatedButton(onPressed: ()=>{}, 
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              
              child: Center(
                child: Text('sign out',
                style: TextStyle(fontSize: 18),),
                
  
              ),
              )  
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
