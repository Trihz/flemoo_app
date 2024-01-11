import 'package:flemoo_app/Settings/set_device.dart';
import 'package:flemoo_app/Settings/sound_setting.dart';
import 'package:flutter/material.dart';

import '../Location/view_geofence.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _Setting();
}

class _Setting extends State<Setting> {
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
        title: Center(child: Text('SETTING')),
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(children: [
        GestureDetector(
          onTap: () {
            /*Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SetDevice()),
            );*/
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SetDevice()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.radio,
                      color: theme.primaryColor,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Set Device GPS',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Add and set your device here')
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewGeofence()),
              );
            },
            child: Row(
              children: [
                Icon(
                  Icons.language,
                  color: theme.primaryColor,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Geofence',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Add geofence here')
                  ],
                )
              ],
            ),
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SoundSetting()),
              );
            },
            child: Row(
              children: [
                Icon(
                  Icons.volume_up,
                  color: theme.primaryColor,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sound Setting',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Set sound on or off here')
                  ],
                ),
                Expanded(
                  child: SizedBox(
                      //color: Colors.transparent,
                      ),
                ),
              ],
            ),
          ),
        ),
        Divider(),
      ]),
    );
  }
}
