import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Contact details',
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Row(
                  children: [
                    Text('Work Mobile : '),
                    Expanded(
                        child: Text(
                      '4526398566',
                      textAlign: TextAlign.end,
                    ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Row(
                  children: [
                    Text('Work email : '),
                    Expanded(
                        child: Text(
                      'xyz@gmail.com',
                      textAlign: TextAlign.end,
                    ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Row(
                  children: [
                    Text('Work Phone : '),
                    Expanded(
                        child: Text(
                      '4563214598',
                      textAlign: TextAlign.end,
                    ))
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
