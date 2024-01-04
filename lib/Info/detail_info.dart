// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DetailInfo extends StatefulWidget {
  const DetailInfo({super.key});

  @override
  State<DetailInfo> createState() => _DetailInfo();
}

class _DetailInfo extends State<DetailInfo> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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
        title: Center(child: Text('DETAIL INFO')),
        foregroundColor: Colors.white,
        backgroundColor: theme.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('GPS Name'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('B 2455 UJD')
                      ]),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.directions_car,
                      color: theme.primaryColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        height: 28,
                        decoration: BoxDecoration(),
                        child: OutlinedButton(
                            onPressed: () {}, child: Text('Online')))
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('GPS Description'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('I put this GPS Tracker in my Honda car')
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('GPS Phone Number'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('+62811456789')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Call',
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Text(
              'Devices can only be called by the center number',
              style: TextStyle(
                  color: Color.fromARGB(192, 16, 173, 235),
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Serial Number'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('7018089100')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Battery'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('90')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Interval GPS'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('20 second')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Status'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Subscribe')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Subscribe Date'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('21 February 2020')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Upgrade Date'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('21 February 2020')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Expired Date'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('21 February 2020')
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
