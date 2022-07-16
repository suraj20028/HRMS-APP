import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Personal extends StatelessWidget {
  const Personal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Personal details',
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
                    Text('PAN : '),
                    Expanded(
                        child: Text(
                      'EWIPR45631',
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
                    Text('Tempory address : '),
                    Expanded(
                        child: Text(
                      '4th block Jayanagar , - 586932',
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
                    Text('Permanent address : '),
                    Expanded(
                        child: Text(
                      'Mepu, Koteshwara , Kundapura taluk , - 576222',
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
                    Text('Bank ac no : '),
                    Expanded(
                        child: Text(
                      '456632155896362',
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
                    Text('Nationality : '),
                    Expanded(
                        child: Text(
                      'Indian',
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
                    Text('Passport no : '),
                    Expanded(
                        child: Text(
                      '4526331452663',
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
                    Text('Aadhaar no : '),
                    Expanded(
                        child: Text(
                      '85693321556354',
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
                    Text('Gender : '),
                    Expanded(
                        child: Text(
                      'Male',
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
                    Text('Age : '),
                    Expanded(
                        child: Text(
                      '35',
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
                    Text('Marital status : '),
                    Expanded(
                        child: Text(
                      'Maried',
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
