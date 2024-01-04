// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

class DevicesLogic {
  String devicesURL = "https://devfleemooservice.trackafrik.com/api/devices";
  var username = 'admin';
  var password = 'AdminFleemoo1234';

  String basicAuth = '';

  Future<List<Map<String, dynamic>>> fetchDevices() async {
    basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
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
          print(device["positionId"]);
        }

        return devices;
      } else {
        print('Request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
