import 'package:flutter/material.dart';

class FuelEfficiencyFactors extends StatefulWidget {
  @override
  State<FuelEfficiencyFactors> createState() => _FuelEfficiencyFactors();
}

class _FuelEfficiencyFactors extends State<FuelEfficiencyFactors> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Fuel Efficiency Factors')),
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Fuel Efficiency Factors',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
              fontSize: 20),
        ),
        Text('JUN 18 - JUN 25'),
        SizedBox(
          height: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Idle Time',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColor,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '22%',
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(children: [
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.red,
                        ),
                        Text(
                          '4%',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ])
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Over RPM',
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '16',
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(children: [
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.green,
                        ),
                        Text(
                          '2%',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ])
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Safety Events',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'EVENTS / 1K MI',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hard Braking',
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '45',
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(children: [
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.red,
                        ),
                        Text(
                          '10%',
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        )
                      ])
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hard Acceleration',
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '23',
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(children: [
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.green,
                        ),
                        Text(
                          '5%',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ])
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Speed',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'MPH',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Average Driving Speed',
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '62',
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(children: [
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.red,
                        ),
                        Text(
                          '5%',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ])
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
            ),
          ],
        )
      ]),
    );
  }
}
