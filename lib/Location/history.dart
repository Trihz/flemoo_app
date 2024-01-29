// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class History extends StatefulWidget {
  @override
  State<History> createState() => _History();
}

class _History extends State<History> {
  Color mainColor = Colors.blue;

  /// HOLDS THE CURRENT COORDINATES OF THE PATH
  List<LatLng> pathPoints = [];

  /// HOLDS THE COORDINATES FROM THE DATABASE
  List<LatLng> originalPath = [
    const LatLng(-0.396546, 36.957207),
    const LatLng(-0.396397, 36.957678),
    const LatLng(-0.396236, 36.957897),
    const LatLng(-0.395948, 36.958334),
    const LatLng(-0.395822, 36.958575),
    const LatLng(-0.395500, 36.958575),
    const LatLng(-0.395132, 36.958575),
    const LatLng(-0.394695, 36.958667),
    const LatLng(-0.394166, 36.958667),
    const LatLng(-0.393810, 36.958564),
    const LatLng(-0.393327, 36.958632),
    const LatLng(-0.393143, 36.958977),
    const LatLng(-0.393097, 36.959377),
    const LatLng(-0.393129, 36.959914),
    const LatLng(-0.393065, 36.960246),
  ];

  /// SLIDER VALUES
  double progressValue = 0;
  double speedValue = 0;

  /// ANIMATION PERIOD
  int animationPeriod = 0;

  /// ANIMATE THE PATH DRAWING PROCESS
  void animatePathDrawing() {
    setState(() {
      pathPoints.clear();
    });

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

  /// WIDGET FOR THE MAP
  Widget displayMap() {
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            initialCenter: originalPath[0],
            initialZoom: 16.0,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            PolylineLayer(
              polylines: [
                Polyline(
                  points: pathPoints,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  strokeWidth: 5.0,
                ),
              ],
            ),
            MarkerLayer(markers: [
              Marker(
                  point: originalPath.first,
                  child: Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 40,
                  )),
              Marker(
                  point: originalPath.last,
                  child: Icon(
                    Icons.location_pin,
                    color: Colors.blue,
                    size: 40,
                  ))
            ])
          ],
        ),
        Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(color: Colors.white),
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
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: const Icon(
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
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: MediaQuery.of(context).size.width * 0.15,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Progress"))),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: const BoxDecoration(
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
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: MediaQuery.of(context).size.width * 0.15,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Speed"))),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: const BoxDecoration(
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
    );
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
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Center(child: Text('HISTORY')),
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
      ),
      body: displayMap(),
    );
  }
}
