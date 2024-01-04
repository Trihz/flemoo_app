// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

class PositionLogic {
  String getPositionURL(int id) {
    return "https://devfleemooservice.trackafrik.com/api/positions?id=$id";
  }

  var usernameAuth = 'admin';
  var passwordAuth = 'AdminFleemoo1234';

  String basicAuth = '';

  Future<void> fetchPositions() async {
    basicAuth =
        'Basic ${base64Encode(utf8.encode('$usernameAuth:$passwordAuth'))}';
    var url = Uri.parse(getPositionURL(2436944));

    try {
      var response = await http.get(
        url,
        headers: <String, String>{'authorization': basicAuth},
      );

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> positions = [];

        List<dynamic> jsonData = json.decode(response.body);
        for (var position in jsonData) {
          positions.add(Map<String, dynamic>.from(position));
        }

        for (var position in positions) {
          print(position);
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
