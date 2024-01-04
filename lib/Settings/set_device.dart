import 'package:flutter/material.dart';

class SetDevice extends StatefulWidget {
  @override
  State<SetDevice> createState() => _SetDevice();
}

class _SetDevice extends State<SetDevice> {
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
          title: Center(child: Text('SET DEVICE')),
          backgroundColor: theme.primaryColor,
          foregroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add',
          child: const Icon(Icons.add),
          shape: CircleBorder(),
          backgroundColor: theme.primaryColor,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select to set device :'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Icon(Icons.directions_car), Text('Move')],
                      ),
                    ),
                    SizedBox(width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('B 2455 UJD [7018089100]'),
                            Row(
                              children: [
                                Container(
                                    height: 20,
                                    child: OutlinedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Online',
                                          style: TextStyle(fontSize: 10),
                                        ))),
                                SizedBox(width: 5),
                                Text('Battery : 90%')
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'I put this GPS Tracker in my Honda car',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Icon(Icons.check)],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Icon(Icons.elderly), Text('Move')],
                      ),
                    ),
                    SizedBox(width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('My Mom [7018089100]'),
                            Row(
                              children: [
                                Container(
                                    height: 20,
                                    child: OutlinedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Subscribe expired',
                                          style: TextStyle(fontSize: 10),
                                        ))),
                                SizedBox(width: 5),
                                Text('Battery : 73%')
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'I gave this GPS Tracker to my mom',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [Icon(Icons.check)],
                        // )
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Icon(Icons.two_wheeler), Text('Move')],
                      ),
                    ),
                    SizedBox(width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('B 2455 UJD [7018089100]'),
                            Row(
                              children: [
                                Container(
                                    height: 16,
                                    child: OutlinedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Power saving',
                                          style: TextStyle(fontSize: 10),
                                        ))),
                                SizedBox(width: 5),
                                Text('Battery : 100%')
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'I put this GPS Tracker in my motorcycle',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [Icon(Icons.check)],
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
