import 'package:flutter/material.dart';

import 'customgraph.dart';

class Overview extends StatefulWidget {
  @override
  State<Overview> createState() => _Overview();
}

class _Overview extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          icon: Icon(Icons.menu),
        ),
        title: Center(child: Text('Overview')),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fuel Trends',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  12.0, 0.0, 8.0, 0.0),
                              child: Text(
                                'Drives',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 30.0,
                              height: 3.0,
                              color: Colors.blue,
                            ),
                            Text(
                              'My Fleet',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 30.0,
                            height: 3.0,
                            color: Colors.orange,
                          ),
                          Text('Motive Average',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    child: CustomPaint(
                      painter: GraphPainter(65, 80,
                          [74, 77, 76, 75, 76, 74, 76, 75, 74, 74, 72, 71]),
                      size: Size(400, 150),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                      'Speeding activity was the main reason why your Fuel Score decling over the last 12 weeks.'),
                  SizedBox(
                    height: 20,
                  )
                ]),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: const Color.fromARGB(255, 36, 32, 32),
              child: Column(
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
                              'Summary',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              'Apr 18 - Apr 25',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    12.0, 0.0, 8.0, 0.0),
                                child: Text(
                                  'Last Week',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                size: 25,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
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
                              'Fuel score',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'UPDATED 04/25',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '71',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 28),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Row(children: [
                              Icon(
                                Icons.arrow_downward,
                                color: Colors.red,
                              ),
                              Text(
                                '1',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 20),
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
                              'Avg. MPG*',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '8.1',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 28),
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
                                '2%',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 20),
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
                              'Distance (mi)',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Apr 18 - Apr 25',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '11.2K',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Row(children: [
                              Icon(
                                Icons.arrow_upward,
                                color: Colors.green,
                              ),
                              Text(
                                '11%',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 16),
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
                              'Fuel Used (gal)*',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '\$6.9K spent',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '1.4K',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
                                style:
                                    TextStyle(color: Colors.red, fontSize: 20),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
