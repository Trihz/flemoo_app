// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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

  /// SLIDER VALUES
  double progressValue = 0;
  double speedValue = 0;

  /// ANIMATION PERIOD
  int animationPeriod = 0;

  void animatePathDrawing() {
    setState(() {
      pathPoints.clear();
    });

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
      LatLng(-0.393143, 36.958977),
      LatLng(-0.393097, 36.959377),
      LatLng(-0.393129, 36.959914),
      LatLng(-0.393065, 36.960246),
    ];

    Duration interval = Duration(milliseconds: animationPeriod);
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
                        color: Color.fromARGB(255, 0, 0, 0), // Line color
                        strokeWidth: 7.0, // Line width
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: (() {
                          animatePathDrawing();
                        }),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Icon(
                              Icons.play_circle,
                              size: 40,
                            )),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Progress"))),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width: MediaQuery.of(context).size.width * 0.6,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Slider(
                                  value: progressValue,
                                  min: 0,
                                  max: 100,
                                  divisions: 10,
                                  activeColor: mainColor,
                                  inactiveColor:
                                      const Color.fromARGB(79, 33, 149, 243),
                                  thumbColor: Colors.blue,
                                  label: '$progressValue',
                                  onChanged: (double value) {
                                    setState(() {
                                      progressValue = value;
                                      print(progressValue);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Speed"))),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width: MediaQuery.of(context).size.width * 0.6,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Slider(
                                  value: speedValue,
                                  min: 0,
                                  max: 1000,
                                  divisions: 1000,
                                  activeColor: mainColor,
                                  inactiveColor:
                                      const Color.fromARGB(79, 33, 149, 243),
                                  thumbColor: Colors.blue,
                                  label: '$speedValue',
                                  onChanged: (double value) {
                                    setState(() {
                                      speedValue = value;
                                      animationPeriod = speedValue.toInt();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
