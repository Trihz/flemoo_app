// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  Color mainColor = Colors.blue;

  List<LatLng> pathPoints = [];

  void animatePathDrawing() {
    List<LatLng> originalPath = [
      LatLng(-0.396546, 36.957207),
      LatLng(-0.396397, 36.957678),
      LatLng(-0.396236, 36.957897),
      LatLng(-0.395948, 36.958334),
      LatLng(-0.395822, 36.958575),
      LatLng(-0.395500, 36.958575),
      LatLng(-0.395132, 36.958575),
      LatLng(-0.394695, 36.958667),
      LatLng(-0.394166, 36.958667),
      LatLng(-0.393810, 36.958564),
      LatLng(-0.393327, 36.958632),
    ];

    const Duration interval = Duration(milliseconds: 1000);
    int index = 0;

    Timer.periodic(interval, (Timer timer) {
      if (index < originalPath.length) {
        setState(() {
          pathPoints.add(originalPath[index]);
          index++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    animatePathDrawing();
  }

  @override
  Widget build(BuildContext context) {
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
            title: Center(child: Text('LIVE LOCATION')),
            backgroundColor: mainColor,
            foregroundColor: Colors.white,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
            ]),
        body: Stack(
          children: [
            Container(
              child: FlutterMap(
                options: MapOptions(
                  initialCenter:
                      LatLng(-0.396006, 36.958207), // Initial map center
                  initialZoom: 16.0, // Initial zoom level
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: pathPoints,
                        color: Colors.blue, // Line color
                        strokeWidth: 10.0, // Line width
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
            ))
          ],
        ));
  }
}
