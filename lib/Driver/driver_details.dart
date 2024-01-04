import 'package:flutter/material.dart';

class DriverDetails extends StatefulWidget {
  @override
  State<DriverDetails> createState() => _DriverDetails();
}

class _DriverDetails extends State<DriverDetails> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Driver Details')),
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Fuel Used (gal)',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '16',
                            style: TextStyle(
                                color: Colors.black,
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
                    ]),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Fuel Wasted',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Row(
                        children: [
                          Text(
                            '\$124',
                            style: TextStyle(
                                color: Colors.black,
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
                    ]),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.025,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(color: theme.primaryColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 100.0, // Adjust the width of the circular image
                        height:
                            100.0, // Adjust the height of the circular image
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors
                                .white, // Set the color of the outline (white in this case)
                            width: 2.0, // Set the width of the outline
                          ),
                          image: DecorationImage(
                            image: AssetImage('images/image.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('DRIVER'),
                            Text(
                              'Daniel Brown',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: theme.primaryColor,
                                  fontSize: 18),
                            ),
                            Text('Vehicle LH160')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Idle Time',
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 20,
                        ),
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
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        )
                      ])
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Over RPM',
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 20,
                        ),
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
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        )
                      ])
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hard Braking',
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 20,
                        ),
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
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        )
                      ])
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Average Driving Speed',
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 20,
                        ),
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
                            color: Colors.green,
                            fontSize: 20,
                          ),
                        )
                      ])
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text('MPG')],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        color: Colors.blueGrey,
                        child: Text(
                          'FLEET AVG.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        color: Colors.amber,
                        child: Text(
                          'KT AVG.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.032,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 206, 203, 203),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('3.4'), Text('FLEET WORST')],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '9.2',
                                style: TextStyle(
                                    color: theme.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('DANIEL',
                                  style: TextStyle(
                                      color: theme.primaryColor,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [Text('12.1'), Text('FLEET BEST')],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
