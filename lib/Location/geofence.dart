// ignore_for_file: sort_child_properties_last, prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:flemoo_app/Location/set_geofence.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Geofence extends StatefulWidget {
  @override
  State<Geofence> createState() => _GeofenceState();
}

class _GeofenceState extends State<Geofence> {
  /// MAIN COLORS
  Color mainColor = Colors.blue;

  /// API PARAMETERS
  String geofenceURL = "https://devfleemooservice.trackafrik.com/api/geofences";
  var usernameAuth = 'admin';
  var passwordAuth = 'AdminFleemoo1234';
  String basicAuth = '';

  /// GEOFENCE DATA

  @override
  void initState() {
    initialFunction();
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
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
        title: const Center(child: Text('GEOFENCE')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => SetGeofence())));
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
        shape: CircleBorder(),
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 1,
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(color: Colors.white),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Geofences",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.72,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(color: Colors.white),
            child: FutureBuilder(
              future: getGeofences(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: mainColor,
                  ));
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No geofences available.'));
                } else {
                  List? geofencesData = snapshot.data;
                  return ListView.builder(
                    itemCount: geofencesData?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 1,
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 20),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  geofencesData?[index]['name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                )),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  geofencesData?[index]['description'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13),
                                )),
                            Divider(),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  /// INITIAL FUNCTION
  void initialFunction() async {
    await getGeofences();
  }

  Future<List> getGeofences() async {
    List geofencesData = [];
    var apiURL = Uri.parse(geofenceURL);
    basicAuth =
        'Basic ${base64Encode(utf8.encode('$usernameAuth:$passwordAuth'))}';

    try {
      var response = await http.get(apiURL, headers: <String, String>{
        'authorization': basicAuth,
        'Content-Type': 'application/json'
      });
      if (response.statusCode == 200) {
        List<dynamic> allGeofences = json.decode(response.body);

        for (var geofence in allGeofences) {
          List geofenceData = [];
          geofenceData.add(geofence['id']);
          geofenceData.add(geofence['calendarId']);
          geofenceData.add(geofence['name']);
          geofenceData.add(geofence['description']);
          geofenceData.add(geofence['area']);
          geofencesData.add(geofence);
        }
        return geofencesData;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    return geofencesData;
  }
}
