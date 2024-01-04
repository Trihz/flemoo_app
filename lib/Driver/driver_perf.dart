import 'package:flutter/material.dart';

import '../customgraph.dart';

class VehiclePerformance2 extends StatefulWidget {
  @override
  State<VehiclePerformance2> createState() => _VehiclePerformance2();
}

class _VehiclePerformance2 extends State<VehiclePerformance2> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ThemeData theme = Theme.of(context);
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
        title: Center(child: Text('Vehicle Performance')),
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vehicle Performance',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColor,
                      fontSize: 20),
                ),
                Text('JUN 18 - JUN 25'),
              ],
            ),
            Icon(
              Icons.local_shipping_outlined,
              size: 36,
            )
          ],
        ),
        Text(
          'Fuel Trends',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
              fontSize: 20),
        ),
        Stack(
          children: [
            SizedBox(
              child: CustomPaint(
                painter: GraphPainter(5.5, 7.5, [
                  6.4,
                  6.1,
                  6.2,
                  6.5,
                  6.5,
                  6.8,
                  6.5,
                  6.7,
                  6.6,
                  6.7,
                  7.0,
                  7.3
                ]),
                size: Size(400, 150),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    color: theme.primaryColor,
                    child: Text(
                      'My Fleet',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    color: Colors.orange,
                    child: Text(
                      'KeepTrucking Average',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
