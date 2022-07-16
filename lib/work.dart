import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Work extends StatelessWidget {
  const Work({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Work details',
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
                    Text('Department : '),
                    Expanded(
                        child: Text(
                      'Accounting',
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
                    Text('Manager : '),
                    Expanded(
                        child: Text(
                      'Sudhesh',
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
                    Text('Work Address : '),
                    Expanded(
                        child: Text(
                      'hrms office,Malleshwaram',
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
                    Text('Work Location : '),
                    Expanded(
                        child: Text(
                      'office',
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
                    Text('Date of joining : '),
                    Expanded(
                        child: Text(
                      '01-06-2010',
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
                    Text('Salary Info : '),
                    Expanded(
                        child: Text(
                      '40000/month',
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
