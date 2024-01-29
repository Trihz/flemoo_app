// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:flemoo_app/Location/add_geofence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class SetGeofence extends StatefulWidget {
  const SetGeofence({super.key});

  @override
  State<SetGeofence> createState() => _SetGeofence();
}

class _SetGeofence extends State<SetGeofence> {
  Color mainColor = Colors.blue;

  /// MAP
  MapController mapController = MapController();

  /// API PARAMETERS
  String devicesURL = "https://devfleemooservice.trackafrik.com/api/devices";
  String geofenceURL = "https://devfleemooservice.trackafrik.com/api/geofences";
  String positionURL(int id) {
    return "https://devfleemooservice.trackafrik.com/api/positions?id=$id";
  }

  /// AUTHENTICATION PARAMETERS
  var usernameAuth = 'admin';
  var passwordAuth = 'AdminFleemoo1234';
  String basicAuth = '';

  /// GEOFENCES PARAMETERS
  List<String> geofenceNames = ["Select Device"];
  String selectedGeofence = "Select Geofence";
  List<Map<String, dynamic>> allGeofences = [];

  /// POSITION PARAMETERS
  double device_latitude = 0;
  double device_longitude = 0;
  List coordinates = [0.0, 0.0];
  double zoomParameter = 3.0;

  /// MAP WIDGET
  Widget displayMap() {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(),
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: LatLng(coordinates[0], coordinates[1]),
                initialZoom: zoomParameter,
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
                      point: LatLng(coordinates[0], coordinates[1]),
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
            child: DropdownButtonHideUnderline(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.7,
                padding: const EdgeInsets.only(left: 10, right: 10),
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
                child: DropdownButton<String>(
                  value: selectedGeofence,
                  hint: Text("Select Geofence"),
                  iconEnabledColor: Colors.black,
                  iconSize: 50,
                  dropdownColor: Color.fromRGBO(255, 255, 255, 1),
                  items: geofenceNames.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedGeofence = newValue!;
                      print(selectedGeofence);
                    });
                  },
                ),
              ),
            )),
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
        Positioned(
            bottom: 15,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.4,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.3,
                  right: MediaQuery.of(context).size.width * 0.3),
              decoration: BoxDecoration(color: Colors.transparent),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                DrawGeofence(coordinates: coordinates))));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                  child: Text(
                    "SAVE",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                  )),
            ))
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
    initialAsyncFunctions();
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
            child: Text('SET GEOFENCE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
      ),
      body: displayMap(),
    );
  }

  /// INITIAL FUNCTION
  void initialAsyncFunctions() async {
    await fetchGeofences();
  }

  ///FETCH GEOFENCES
  Future<void> fetchGeofences() async {
    basicAuth =
        'Basic ${base64Encode(utf8.encode('$usernameAuth:$passwordAuth'))}';
    var url = Uri.parse(geofenceURL);

    try {
      var response = await http.get(
        url,
        headers: <String, String>{'authorization': basicAuth},
      );

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> geofences = [];

        List<dynamic> jsonData = json.decode(response.body);
        for (var geofence in jsonData) {
          geofences.add(Map<String, dynamic>.from(geofence));
        }

        setState(() {
          allGeofences = geofences;
        });

        for (var geofence in geofences) {
          setState(() {
            geofenceNames.add(geofence["name"]);
          });
        }

        print(geofenceNames);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
