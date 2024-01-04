// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names, must_be_immutable

import 'dart:convert';
import 'package:flemoo_app/Edit/edit_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class DrawGeofence extends StatefulWidget {
  List coordinates = [];
  String deviceName = "";
  DrawGeofence(
      {super.key, required this.coordinates, required this.deviceName});

  @override
  State<DrawGeofence> createState() => _DrawGeofenceState();
}

class _DrawGeofenceState extends State<DrawGeofence> {
  Color mainColor = Colors.blue;

  /// MAP
  MapController mapController = MapController();

  /// API PARAMETERS
  String devicesURL = "https://devfleemooservice.trackafrik.com/api/devices";
  String positionURL(int id) {
    return "https://devfleemooservice.trackafrik.com/api/positions?id=$id";
  }

  var usernameAuth = 'admin';
  var passwordAuth = 'AdminFleemoo1234';
  String basicAuth = '';

  /// MAP WIDGET
  Widget displayMap() {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(),
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter:
                    LatLng(widget.coordinates[0], widget.coordinates[1]),
                initialZoom: 5,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point:
                          LatLng(widget.coordinates[0], widget.coordinates[1]),
                      child: Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 60.0,
                      ),
                    ),
                  ],
                )
              ],
            )),
        Positioned(
          top: 15,
          left: 10,
          right: 10,
          child: Container(),
        ),
        Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: const Offset(0, 2),
                    blurRadius: 3,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        _zoomIn();
                      },
                      child: Icon(Icons.add)),
                  GestureDetector(
                      onTap: () {
                        _zoomOut();
                      },
                      child: Icon(Icons.remove))
                ],
              ),
            )),
            Positioned(child: )
      ],
    );
  }

  /// ZOOM IN
  void _zoomIn() {
    mapController.move(
        mapController.camera.center, mapController.camera.zoom + 1);
  }

  /// ZOOM OUT
  void _zoomOut() {
    mapController.move(
        mapController.camera.center, mapController.camera.rotationRad - 1);
  }

  @override
  void initState() {
    print(widget.deviceName);
    super.initState();
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
        title: Center(
            child: Text('DRAW GEOFENCE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
      ),
      body: displayMap(),
    );
  }
}