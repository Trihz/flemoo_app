// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flemoo_app/Driver/driver_details.dart';
import 'package:flemoo_app/Driver/driver_perf.dart';
import 'package:flemoo_app/Edit/edit_profile_picture.dart';
import 'package:flemoo_app/Inspection/new_inspection.dart';
import 'package:flutter/material.dart';

class VehicleInspection extends StatefulWidget {
  @override
  State<VehicleInspection> createState() => _VehicleInspection();
}

class _VehicleInspection extends State<VehicleInspection> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        title: Center(child: Text('Vehicle Inspection')),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 16.0),
              child: Text(
                'Vehicle Status',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [Text('SPEED'), Text('42 MPH')],
                )),
                Expanded(
                    child: Column(
                  children: [Text('FUEL'), Text('80%')],
                )),
                Expanded(
                    child: Column(
                  children: [Text('DEF'), Text('60%')],
                )),
                Expanded(
                    child: Column(
                  children: [Text('MIL'), Icon(Icons.engineering)],
                ))
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fault Codes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        child: Center(
                          child: Text(
                            '5',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        color: Colors.red,
                      ),
                      Icon(Icons.navigate_next),
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Text(
              'Other Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ODOMETER', style: TextStyle(fontSize: 18)),
                  SizedBox(
                    height: 6,
                  ),
                  Text('22,534 mi',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ENGINE HOURS', style: TextStyle(fontSize: 18)),
                  SizedBox(
                    height: 8,
                  ),
                  Text('15,000',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('LICENSE', style: TextStyle(fontSize: 18)),
                  SizedBox(
                    height: 8,
                  ),
                  Text('ABC-31GE33',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('VIN', style: TextStyle(fontSize: 18)),
                  SizedBox(
                    height: 8,
                  ),
                  Text('33612223GGG332',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('MAKE/MODEL', style: TextStyle(fontSize: 18)),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Volvo VNL 300',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 1,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                onPressed: () {},
                child: const Text('Contact Driver'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
