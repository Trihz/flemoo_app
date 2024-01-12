// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_const_constructors

import 'dart:convert';

import 'package:flemoo_app/Location/view_geofence.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddGeofenceDetails extends StatefulWidget {
  const AddGeofenceDetails({super.key});

  @override
  State<AddGeofenceDetails> createState() => _AddGeofenceDetailsState();
}

class _AddGeofenceDetailsState extends State<AddGeofenceDetails> {
  Color mainColor = Colors.blue;

  /// API PARAMETERS
  String geofenceURL = "https://devfleemooservice.trackafrik.com/api/geofences";
  var usernameAuth = 'admin';
  var passwordAuth = 'AdminFleemoo1234';
  String basicAuth = '';

  /// GEOFENCE DETAILS
  String geofenceName = "";
  String geofenceDescription = "";

  /// GEOFENCE SAVE SUCCESS
  void geofenceSaveSuccess(BuildContext context) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Add Geofence Success"),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      child: Image.asset("images/checked.png"))
                ],
              ),
            ),
          );
        }));
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
        title: const Center(
            child: Text('GEOFENCE DETAILS',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 1,
            margin: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const Text(
                      "Geofence name",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),
                    )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        geofenceName = value;
                      });
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const Text(
                      "Geofence description",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),
                    )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        geofenceDescription = value;
                      });
                    },
                    maxLines: 20,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                    child: Text("CANCEL")),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: ElevatedButton(
                    onPressed: () {
                      if (geofenceName.isEmpty || geofenceDescription.isEmpty) {
                        print("Please input all the details");
                      } else {
                        saveGeofenceDetails(geofenceName, geofenceDescription);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                    child: Text("DONE")),
              ),
            ],
          )
        ],
      ),
    );
  }

  /// SAVE GEOFENCE DETAILS
  Future<void> saveGeofenceDetails(
      String geofenceName, String geofenceDescription) async {
    final apiURL = Uri.parse(geofenceURL);
    basicAuth =
        'Basic ${base64Encode(utf8.encode('$usernameAuth:$passwordAuth'))}';
    try {
      final response = await http.post(apiURL,
          headers: <String, String>{
            'authorization': basicAuth,
            'Content-Type': 'application/json'
          },
          body: toJSON({
            "attributes": {},
            "calendarId": 1,
            "name": geofenceName,
            "description": geofenceDescription,
            "area":
                "POLYGON((50.23333354825988 8.630563964241324, 50.22985037808232 8.606294260396464, 50.21636313400313 8.602093740095075, 50.209845792910556 8.653507178533214, 50.220107459680634 8.657471170141823, 50.2256204731776 8.643321109642851, 50.23333354825988 8.630563964241324)))"
          }));

      if (response.statusCode == 200) {
        print(response.body);
        geofenceSaveSuccess(context);
        Future.delayed(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => ViewGeofence())));
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  /// TO JSON
  String toJSON(Object data) {
    return jsonEncode(data);
  }
}
