import 'package:flutter/material.dart';

class Geofence extends StatefulWidget {
  @override
  State<Geofence> createState() => _GeofenceState();
}

class _GeofenceState extends State<Geofence> {
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
        title: Center(child: Text('GEOFENCE')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add',
        child: const Icon(Icons.add),
        shape: CircleBorder(),
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 8.0, 9.0, 0.0),
            child: Text(
              'Geofence List:',
            ),
          ),
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
                              'Office Area',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                                'This is the area of my office, it is around 200 meters'),
                            Text('Position: -6.168033, 106.900467'),
                            Text('Radius: 200.0m'),
                            Text('Active: 1'),
                            Divider(),
                          ]),
                    ),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Home Area',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                                'This is the area of my home, it is around 150 meters'),
                            Text('Position: -6.168033, 106.900467'),
                            Text('Radius: 150.0m'),
                            Text('Active: 1'),
                            Divider(),
                          ]),
                    ),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lotte Mart Area',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                                'This is the area of my office, it is around 200 meters'),
                            Text('Position: -6.168033, 106.900467'),
                            Text('Radius: 165.0m'),
                            Text('Active: 1'),
                            Divider(),
                          ]),
                    ),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sunlake Hotel',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                                'This is the area of my office, it is around 200 meters'),
                            Text('Position: -6.168033, 106.900467'),
                            Text('Radius: 130.0m'),
                            Text('Active: 1'),
                            Divider(),
                          ]),
                    ),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Monas Area',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                                'This is the area of my office, it is around 200 meters'),
                            Text('Position: -6.168033, 106.900467'),
                            Text('Radius: 560.0m'),
                            Text('Active: 1'),
                            Divider(),
                          ]),
                    ),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'GBK Area',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                                'This is the area of my office, it is around 200 meters'),
                            Text('Position: -6.168033, 106.900467'),
                            Text('Radius: 740.0m'),
                            Text('Active: 1'),
                            Divider(),
                          ]),
                    ),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Central Park Jakarta',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                                'This is the area of my Central Park Mall in Jakarta, it is around 200 meters'),
                            Text('Position: -6.168033, 106.900467'),
                            Text('Radius: 200.0m'),
                            Text('Active: 1'),
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
