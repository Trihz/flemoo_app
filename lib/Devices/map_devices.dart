// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:flemoo_app/Devices/position_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class MapDevices extends StatefulWidget {
  const MapDevices({super.key});

  @override
  State<MapDevices> createState() => _MapDevicesState();
}

class _MapDevicesState extends State<MapDevices> {
  Color mainColor = Colors.blue;

  /// MAP
  MapController mapController = MapController();

  /// STATUS VARIABLES
  /// API PARAMETERS
  String devicesURL = "https://devfleemooservice.trackafrik.com/api/devices";
  String getPositionURL(int id) {
    return "https://devfleemooservice.trackafrik.com/api/positions?id=$id";
  }

  var usernameAuth = 'admin';
  var passwordAuth = 'AdminFleemoo1234';
  String basicAuth = '';

  /// DEVICES PARAMETERS
  List positionIDs = [];
  List<String> deviceNames = [];
  String selectedDevice = "";

  /// POSITION PARAMETERS
  double device_latitude = 0;
  double device_longitude = 0;
  List coordinates = [];

  @override
  void initState() {
    /// API AUTHENTICATION
    basicAuth =
        'Basic ${base64Encode(utf8.encode('$usernameAuth:$passwordAuth'))}';
    initialFunction();
    super.initState();
  }

  /// MAP WIDGET
  Widget displayMap() {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(),
            child: FutureBuilder<List>(
              future: fetchFirstPosition(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      initialCenter: LatLng(0.0, 0.0),
                      initialZoom: 3,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(
                        markers: loadMarkers(),
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      initialCenter: LatLng(0.0, 0.0),
                      initialZoom: 3,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(
                        markers: loadMarkers(),
                      )
                    ],
                  );
                }
              },
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
            ))
      ],
    );
  }

  /// function to zoom in the map
  void _zoomIn() {
    mapController.move(mapController.center, mapController.zoom + 1);
  }

  /// function to zoom out the map
  void _zoomOut() {
    mapController.move(mapController.center, mapController.zoom - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
        title: const Center(child: Text('MAP ALL DEVICES')),
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))],
      ),
      body: displayMap(),
    );
  }

  /// INITIAL FUNCTION
  void initialFunction() async {
    await fetchDevices();
    await fetchFirstPosition();
    await fetchPositions();
  }

  /// LOAD MARKERS
  List<Marker> loadMarkers() {
    List<Marker> markers = [];

    for (var i = 0; i < coordinates.length; i++) {
      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: LatLng(coordinates[i][0], coordinates[i][1]),
          child: Icon(
            Icons.location_pin,
            color: Colors.red,
            size: 60.0,
          ),
        ),
      );
    }
    return markers;
  }

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

        for (var device in devices) {
          setState(() {
            positionIDs.add(device["positionId"]);
          });
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<List> fetchFirstPosition() async {
    var url = Uri.parse(getPositionURL(2436944));
    List coordinate = [];

    try {
      var response = await http.get(
        url,
        headers: <String, String>{'authorization': basicAuth},
      );

      if (response.statusCode == 200) {
        List<dynamic> position = json.decode(response.body);
        print(position[0]['latitude']);

        device_latitude = position[0]['latitude'];
        device_longitude = position[0]['longitude'];
        coordinate = [device_latitude, device_longitude];
        coordinates.add(coordinate);

        print(coordinates);
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

  Future<List> fetchPositions() async {
    for (var positionID in positionIDs) {
      print(positionID);
      var url = Uri.parse(getPositionURL(positionID));
      List coordinate = [];

      try {
        var response = await http.get(
          url,
          headers: <String, String>{'authorization': basicAuth},
        );

        if (response.statusCode == 200) {
          List<dynamic> position = json.decode(response.body);
          print(position[0]['latitude']);

          setState(() {
            device_latitude = position[0]['latitude'];
            device_longitude = position[0]['longitude'];
            coordinate = [device_latitude, device_longitude];
            coordinates.add(coordinate);
          });

          print(coordinates);
        } else {
          print('Request failed with status: ${response.statusCode}');
        }
      } catch (e) {
        print('Error: $e');
        return [];
      }
    }

    return coordinates;
  }
}
