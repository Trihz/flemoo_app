import 'package:flutter/material.dart';

class SoundSetting extends StatefulWidget {
  @override
  State<SoundSetting> createState() => _SoundSetting();
}

class _SoundSetting extends State<SoundSetting> {
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
        title: Center(child: Text('SOUND SETTING')),
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(children: [
        Row(
          children: [
            Icon(
              Icons.pause_circle_filled,
              color: theme.primaryColor,
            ),
            Flexible(
              child: Text(
                'Sound when device move at Live Location Menu and Map all Devices Menu',
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
            Switch(value: true, onChanged: (item) {})
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.play_circle_filled,
                  color: theme.primaryColor,
                ),
                Text(
                  'SOS Alarm Sound',
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
              ],
            ),
            Switch(value: true, onChanged: (item) {})
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.play_circle_filled,
                  color: theme.primaryColor,
                ),
                Text(
                  'Geofence Sound',
                  softWrap: true,
                ),
              ],
            ),
            Switch(value: true, onChanged: (item) {})
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white)),
              onPressed: () {},
              child: Text('SAVE')),
        ),
      ]),
    );
  }
}
