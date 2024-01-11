// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';

class LiveLocation extends StatefulWidget {
  const LiveLocation({super.key});

  @override
  State<LiveLocation> createState() => _LiveLocationState();
}

class _LiveLocationState extends State<LiveLocation> {
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

  /// DEVICES PARAMETERS
  List<String> deviceNames = ["Select Device"];
  String selectedDevice = "Select Device";
  List<Map<String, dynamic>> allDevices = [];
  String deviceSpeed = "";
  String deviceTime = "";
  String deviceAddress = "";
  String deviceDistance = "";

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
            top: 0,
            child: DropdownButtonHideUnderline(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 1,
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
                  value: selectedDevice,
                  hint: Text("Select Device"),
                  iconEnabledColor: Colors.black,
                  iconSize: 50,
                  dropdownColor: Color.fromRGBO(255, 255, 255, 1),
                  items: deviceNames.map((String value) {
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
                      selectedDevice = newValue!;
                      int positionID = getPositionID(selectedDevice);
                      fetchCoordinates(positionID);
                    });
                  },
                ),
              ),
            )),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            left: MediaQuery.of(context).size.width * 0.2,
            right: MediaQuery.of(context).size.width * 0.2,
            child: DropdownButtonHideUnderline(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.6,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white60,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(0, 2),
                      blurRadius: 3,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Distance: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      deviceDistance,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            )),
        Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.6,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.2,
                  right: MediaQuery.of(context).size.width * 0.2),
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
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
                  Row(
                    children: [
                      Icon(Icons.speed),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Text(
                        deviceSpeed,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.punch_clock),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Text(
                        deviceTime,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              ),
            )),
        Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 1,
              padding: const EdgeInsets.only(left: 5, right: 5),
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
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  deviceAddress,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )),
        Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
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
            ))
      ],
    );
  }

  /// function to zoom in the map
  void _zoomIn() {
    mapController.move(
        mapController.camera.center, mapController.camera.zoom + 1);
  }

  /// function to zoom out the map
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
          title: Center(child: Text('LIVE LOCATION')),
          backgroundColor: mainColor,
          foregroundColor: Colors.white,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
          ]),
      body: displayMap(),
    );
  }

  /// INITIAL FUNCTION
  void initialAsyncFunctions() async {
    await fetchDevices();
  }

  ///FETCH DEVICES
  Future<void> fetchDevices() async {
    basicAuth =
        'Basic ${base64Encode(utf8.encode('$usernameAuth:$passwordAuth'))}';
    var url = Uri.parse(devicesURL);

    try {
      var response = await http.get(
        url,
        headers: <String, String>{'authorization': basicAuth},
      );

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> devices = [];

        List<dynamic> jsonData = json.decode(response.body);
        for (var device in jsonData) {
          devices.add(Map<String, dynamic>.from(device));
        }

        setState(() {
          allDevices = devices;
        });

        for (var device in devices) {
          setState(() {
            deviceNames.add(device["name"]);
          });
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  /// COORDINATES OF SELECTED DEVICE
  int getPositionID(String deviceName) {
    int positionID = 0;
    for (var device in allDevices) {
      if (device["name"] == deviceName) {
        positionID = device["positionId"];
      }
    }
    print(positionID);
    return positionID;
  }

  /// FETCH COORDINATES
  Future<List> fetchCoordinates(int positionID) async {
    var url = Uri.parse(positionURL(positionID));

    try {
      var response = await http.get(
        url,
        headers: <String, String>{'authorization': basicAuth},
      );

      if (response.statusCode == 200) {
        List<dynamic> position = json.decode(response.body);

        setState(() {
          device_latitude = position[0]['latitude'];
          device_longitude = position[0]['longitude'];
          coordinates = [device_latitude, device_longitude];
          deviceSpeed = "${position[0]['speed'].toString()} Km/h";
          deviceDistance =
              "${position[0]['attributes']['distance'].toString()} km";
          deviceAddress = position[0]['address'].toString();
          if (deviceAddress == "null") {
            deviceAddress = "Address not found";
          }

          DateTime dateTime =
              DateTime.parse(position[0]['deviceTime'].toString());
          deviceTime = DateFormat.yMd().add_Hms().format(dateTime);
        });

        /// Update the initial zoom and center
        mapController.move(LatLng(coordinates[0], coordinates[1]), 5.0);

        print(coordinates);
        print(deviceSpeed);
        print(deviceTime);
        print(deviceAddress);
        print(deviceDistance);

        return coordinates;
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }

    return coordinates;
  }
}
