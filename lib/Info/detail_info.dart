// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailInfo extends StatefulWidget {
  const DetailInfo({super.key});

  @override
  State<DetailInfo> createState() => _DetailInfo();
}

class _DetailInfo extends State<DetailInfo> {
  Color mainColor = Colors.blue;

  /// DEVICES PARAMETERS
  List<String> devicesNames = ["Select Device"];
  String selectedDevice = "Select Device";
  List<Map<String, dynamic>> devices = [];

  /// DEVICE DETAILS TO BE DISPLAYED
  String deviceName = "";
  String deviceNumber = "";
  String deviceSerialNumber = "";
  String deviceStatus = "";
  String deviceExpirationDate = "";

  /// API PARAMETERS
  String devicesURL = "https://devfleemooservice.trackafrik.com/api/devices";
  var usernameAuth = 'admin';
  var passwordAuth = 'AdminFleemoo1234';
  String basicAuth = '';

  /// ALL DEVICES DROPDOWN
  Widget devicesDropdown() {
    return DropdownButtonHideUnderline(
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
          hint: Text("Select Geofence"),
          iconEnabledColor: Colors.black,
          iconSize: 50,
          dropdownColor: Color.fromRGBO(255, 255, 255, 1),
          items: devicesNames.map((String value) {
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
              getDevice(selectedDevice);
            });
          },
        ),
      ),
    );
  }

  /// DEVICES DETAILS
  Widget deviceDetails() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("GPS Name",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600))),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        deviceName,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ]),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.31,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Center(
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.045,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(deviceStatus,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700))
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("GPS Phone Number",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600))),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  deviceNumber,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              )
            ]),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Serial Number",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600))),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  deviceSerialNumber,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              )
            ]),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Status",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600))),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  deviceStatus,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              )
            ]),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Expired Date",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600))),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  deviceExpirationDate,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

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
          icon: Icon(Icons.arrow_back),
        ),
        title: Center(child: Text('DETAIL INFO')),
        foregroundColor: Colors.white,
        backgroundColor: mainColor,
      ),
      body: Column(
        children: [devicesDropdown(), deviceDetails()],
      ),
    );
  }

  /// INITIAL FUNCTION
  void initialFunction() async {
    await getDeviceDetails();
  }

  /// GET DEVICE DETAILS (FROM DATABASE)
  Future<void> getDeviceDetails() async {
    final apiURL = Uri.parse(devicesURL);
    basicAuth =
        'Basic ${base64Encode(utf8.encode('$usernameAuth:$passwordAuth'))}';
    try {
      final response = await http
          .get(apiURL, headers: <String, String>{'authorization': basicAuth});
      if (response.statusCode == 200) {
        List<dynamic> deviceDetails = json.decode(response.body);

        for (var device in deviceDetails) {
          setState(() {
            devices.add(device);
            devicesNames.add(device['name']);
          });
        }

        print(devicesNames);
      }
    } catch (e) {
      print(e);
    }
  }

  /// QUERY DEVICE(FROM STORED LIST)
  void getDevice(String name) {
    for (var device in devices) {
      if (name == device['name']) {
        setState(() {
          deviceName = device['name'] ?? "";
          deviceNumber = device['phone'] ?? "";
          deviceSerialNumber = device['uniqueId'] ?? "";
          deviceStatus = device['status'] ?? "";
          deviceExpirationDate = device['expirationTime'] ?? "";
        });

        print(deviceName);
        print(deviceNumber);
        print(deviceSerialNumber);
        print(deviceStatus);
        print(deviceExpirationDate);
      }
    }
  }
}
