// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CommandHistory extends StatefulWidget {
  @override
  State<CommandHistory> createState() => _CommandHistory();
}

class _CommandHistory extends State<CommandHistory> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
        title: Center(child: Text('DEVICE COMMAND HISTORY')),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Normal mode',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 16),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Success',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text('12 Jul 2020, 14:39 | Android'),
                            SizedBox(
                              height: 6,
                            ),
                            Divider(),
                          ]),
                    ),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Power saving mode',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Success',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text('12 Jul 2020, 12:39 | Android'),
                            SizedBox(
                              height: 6,
                            ),
                            Divider(),
                          ]),
                    ),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Upload interval',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              '20 second',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text('12 Jul 2020, 10:39 | Android'),
                            SizedBox(
                              height: 6,
                            ),
                            Divider(),
                          ]),
                    ),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Update center number',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              '+628118882738900',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text('12 Jul 2020, 10:39 | Android'),
                            SizedBox(
                              height: 6,
                            ),
                            Divider(),
                          ]),
                    ),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Update center number',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              '+62876483928773',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text('12 Jul 2020, 10:39 | Android'),
                            SizedBox(
                              height: 6,
                            ),
                            Divider(),
                          ]),
                    ),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Update center number',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              '+629387363792',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text('12 Jul 2020, 10:39 | Android'),
                            SizedBox(
                              height: 6,
                            ),
                            Divider(),
                          ]),
                    ),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Update center number',
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              '+628393974939',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text('12 Jul 2020, 10:39 | Android'),
                            SizedBox(
                              height: 6,
                            ),
                            Divider(),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
