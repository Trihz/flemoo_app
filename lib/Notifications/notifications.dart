// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  State<NotificationsPage> createState() => _NotificationsPage();
}

class _NotificationsPage extends State<NotificationsPage> {
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
        title: Center(child: Text('NOTIFICATION')),
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
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                children: [
                                  TextSpan(text: 'Your GPS '),
                                  TextSpan(
                                    text: 'B 2455 UJD',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: ' with Serial Number '),
                                  TextSpan(
                                    text: '7023849479',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: ' is out of fence! '),
                                  TextSpan(
                                    text: 'iJTracker',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: ' [Auto Geofence]')
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text('12 Jul 2020, 14:39'),
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
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                children: [
                                  TextSpan(text: 'Your GPS '),
                                  TextSpan(
                                    text: 'B 2455 UJD',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: ' with Serial Number '),
                                  TextSpan(
                                    text: '7023849479',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: ' is offline! '),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text('12 Jul 2020, 12:39'),
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
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                children: [
                                  TextSpan(text: 'Your GPS '),
                                  TextSpan(
                                    text: 'B 2455 UJD',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: ' with Serial Number '),
                                  TextSpan(
                                    text: '7023849479',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(
                                      text: ' has low power and already off! '),
                                  TextSpan(
                                    text: ' [0%].',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: ' Charge it immediately !')
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text('12 Jul 2020, 10:39'),
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
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                children: [
                                  TextSpan(text: 'Your GPS '),
                                  TextSpan(
                                    text: 'B 2455 UJD',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: ' with Serial Number '),
                                  TextSpan(
                                    text: '7023849479',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(
                                      text: ' is expired ! Please contact '),
                                  TextSpan(
                                    text: 'iJTracker',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: ' to renew.')
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text('12 Jul 2020, 10:39'),
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
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                children: [
                                  TextSpan(text: 'Your GPS '),
                                  TextSpan(
                                    text: 'B 2455 UJD',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: ' with Serial Number '),
                                  TextSpan(
                                    text: '7023849479',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(
                                      text: ' is expired ! Please contact '),
                                  TextSpan(
                                    text: 'iJTracker',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: ' to renew.')
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text('12 Jul 2020, 10:39'),
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
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                children: [
                                  TextSpan(text: 'Your GPS '),
                                  TextSpan(
                                    text: 'B 2455 UJD',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: ' with Serial Number '),
                                  TextSpan(
                                    text: '7023849479',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(
                                      text: ' is expired ! Please contact '),
                                  TextSpan(
                                    text: 'iJTracker',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: ' to renew.')
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text('12 Jul 2020, 10:39'),
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
                            const SizedBox(
                              height: 6,
                            ),
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                children: [
                                  TextSpan(text: 'Your GPS '),
                                  TextSpan(
                                    text: 'B 2455 UJD',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: ' with Serial Number '),
                                  TextSpan(
                                    text: '7023849479',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(
                                      text: ' is expired ! Please contact '),
                                  TextSpan(
                                    text: 'iJTracker',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  TextSpan(text: ' to renew.')
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text('12 Jul 2020, 10:39'),
                            const SizedBox(
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
