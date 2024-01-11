// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:convert';

import 'package:flemoo_app/Account/accounts.dart';
import 'package:flemoo_app/Authentication/login_page.dart';
import 'package:flemoo_app/Devices/map_devices.dart';
import 'package:flemoo_app/Location/history_gps.dart';
import 'package:flemoo_app/Location/live_location.dart';
import 'package:flemoo_app/Location/set_geofence.dart';
import 'package:flemoo_app/Location/view_geofence.dart';
import 'package:flemoo_app/Notifications/notifications.dart';
import 'package:flemoo_app/Settings/settings.dart';
import 'package:flemoo_app/Vehicle/vehicle_inspection.dart';
import 'package:flutter/material.dart';

import '../Edit/edit_device.dart';
import '../Fuel/fuel_efficiency.dart';
import '../Info/detail_info.dart';
import '../command_history.dart';
import '../overview.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  String userName = "";
  String userGmail = "";
  int userID = 0;
  MyHomePage({
    required this.userName,
    required this.userGmail,
    required this.userID,
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color mainColor = Colors.blue;

  /// TOTAL DEVICES
  String totalDevices = "";

  /// API PARAMETERS
  String devicesURL = "https://devfleemooservice.trackafrik.com/api/devices";
  var usernameAuth = 'admin';
  var passwordAuth = 'AdminFleemoo1234';
  String basicAuth = '';

  @override
  void initState() {
    print(widget.userName);
    initialFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.help_outline,
          ),
          onPressed: () {},
        ),
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
        title: Column(
          children: [
            Image(
              image: AssetImage('images/fleemoo.png'),
              height: 60,
              width: 300,
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
            child: Stack(
              children: [
                Icon(
                  Icons.notifications,
                  size: 32.0,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '6',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Setting()),
                );
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      child: ClipOval(
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AccountDetails(
                                            userName: widget.userName,
                                            userGmail: widget.userGmail,
                                            userID: widget.userID,
                                          )),
                                );
                              },
                              child: Image(
                                  image: AssetImage('images/coffee.png')))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.userName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          VehicleInspection()),
                                );
                              },
                              child: Icon(
                                Icons.directions_car,
                                color: mainColor,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.055,
                              width: MediaQuery.of(context).size.width * 0.51,
                              decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Center(
                                child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Total Devices:',
                                            style: TextStyle(
                                                color: mainColor,
                                                fontSize: 16)),
                                        Text(totalDevices,
                                            style: TextStyle(
                                                color: mainColor,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700))
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    logoutUser();
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
              child: Text('Online | Battery: 90%',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MapDevices()),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 5 / 42,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [
                          Icon(
                            Icons.map,
                            color: mainColor,
                          ),
                          Text('Map'),
                          Text('All Devices')
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LiveLocation()),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 5 / 42,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: mainColor,
                          ),
                          Text('Live Location'),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HistoryGps()),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 5 / 42,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [
                          Icon(
                            Icons.history,
                            color: mainColor,
                          ),
                          Text('History Location'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SetGeofence()),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 5 / 42,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [
                          Icon(
                            Icons.language,
                            color: mainColor,
                          ),
                          Text('Set Geofence'),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailInfo()),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 5 / 42,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [
                          Icon(
                            Icons.info,
                            color: mainColor,
                          ),
                          Text(
                            'Detail Info',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditDevice()),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 5 / 42,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [
                          Icon(
                            Icons.edit,
                            color: mainColor,
                          ),
                          Text('Edit Device'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 5 / 42,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        Icon(
                          Icons.question_answer,
                          color: mainColor,
                        ),
                        Text('Cut-off'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewGeofence()),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 5 / 42,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [
                          Icon(
                            Icons.language,
                            color: mainColor,
                          ),
                          Text('View Geofences'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 5 / 42,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Column(
                      children: [
                        Icon(
                          Icons.question_answer,
                          color: mainColor,
                        ),
                        Text('Chat'),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 5 / 42,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Column(
                      children: [
                        Icon(
                          Icons.refresh,
                          color: mainColor,
                        ),
                        Text('Restart Device'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CommandHistory()),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 5 / 42,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [
                          Icon(
                            Icons.assignment,
                            color: mainColor,
                          ),
                          Text(
                            'Device Command History',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationsPage()),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 5 / 42,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [
                          Icon(
                            Icons.fact_check,
                            color: mainColor,
                          ),
                          Text('Notifications'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 5 / 42,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        Icon(
                          Icons.warning,
                          color: mainColor,
                        ),
                        Text('Safety'),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 5 / 42,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        Icon(
                          Icons.directions_car,
                          color: mainColor,
                        ),
                        Text('Maintenance'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FuelEfficiencyFactors()),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 5 / 42,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [
                          Icon(
                            Icons.local_car_wash,
                            color: mainColor,
                          ),
                          Text('Fuel'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 5 / 42,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        Text('Health'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }

  /// INITIAL FUNCTION
  void initialFunction() async {
    await getTotalDevices();
  }

  Future<void> logoutUser() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => LoginPage())));
  }

  /// TOTAL NUMBER OF DEVICES
  Future<void> getTotalDevices() async {
    int devicesCount = 0;
    final apiURL = Uri.parse(devicesURL);
    basicAuth =
        'Basic ${base64Encode(utf8.encode('$usernameAuth:$passwordAuth'))}';

    try {
      final response = await http
          .get(apiURL, headers: <String, String>{'authorization': basicAuth});
      if (response.statusCode == 200) {
        List<dynamic> devices = json.decode(response.body);
        devicesCount = devices.length;
        setState(() {
          totalDevices = devicesCount.toString();
        });
        print(devicesCount);
      } else {
        print(response.body);
      }
    } catch (e) {}
  }
}
