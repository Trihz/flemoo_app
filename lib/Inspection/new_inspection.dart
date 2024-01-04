import 'package:flutter/material.dart';

class NewInspection extends StatefulWidget {
  @override
  State<NewInspection> createState() => _NewInspection();
}

class _NewInspection extends State<NewInspection> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(
                    context,
                  );
                },
                child: Text('Cancel')),
          ],
        ),
        title: Center(child: Text('New Inspection')),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [Text('Save')],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'General',
                        style: TextStyle(fontSize: 20),
                      ),
                      //Divider(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Defects',
                        style:
                            TextStyle(color: theme.primaryColor, fontSize: 20),
                      ),
                      // Container(
                      //   height: 4.0,
                      //   //width: 60,
                      //   color: Colors.blue,
                      // ),
                      //Divider(),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Sign',
                        style: TextStyle(fontSize: 20),
                      ),
                      //Divider(),
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Divider(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 4.0,
                      //width: 60,
                      color: Colors.blue,
                    ),
                    //Divider(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Divider(),
                  ],
                ),
              )
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
            child: Text(
              'Vehicle PT3732',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
            child: Row(
              children: [
                Text(
                  'Battery',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
                    child: Text(
                      'MAJOR',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ),
                  color: Color.fromARGB(255, 255, 192, 187),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
            child: Text(
              'Battery is dead.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
            child: Image(image: AssetImage('images/battery.jpg')),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
            child: Row(
              children: [
                Text(
                  'Tires',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
                    child: Text(
                      'MINOR',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ),
                  color: Color.fromARGB(255, 223, 217, 217),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
            child: Text(
              'They\'re beginning to wear out. Nothing is serious at the moment, '
              'but we should keep an eye out.',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
            child: Container(
              //width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                  child: Text(
                    'Add/Remove Vehicle Defects',
                    style: TextStyle(fontSize: 20, color: theme.primaryColor),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
