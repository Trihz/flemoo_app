import 'package:flutter/material.dart';

import 'history.dart';

class HistoryGps extends StatefulWidget {
  @override
  State<HistoryGps> createState() => _HistoryGps();
}

enum HistoryDate { Today, Yesterday, Other }

HistoryDate selectedDate = HistoryDate.Other;

class _HistoryGps extends State<HistoryGps> {
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
          title: Center(child: Text('HISTORY GPS')),
          backgroundColor: theme.primaryColor,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Icon'),
            Column(children: [
              RadioListTile<HistoryDate>(
                title: Row(children: [Text('Today')]),
                value: HistoryDate.Today,
                groupValue: selectedDate,
                onChanged: (value) {},
              ),
              RadioListTile<HistoryDate>(
                title: Row(children: [Text('Yesterday')]),
                value: HistoryDate.Yesterday,
                groupValue: selectedDate,
                onChanged: (value) {},
              ),
              RadioListTile<HistoryDate>(
                title: Row(children: [Text('Other')]),
                value: HistoryDate.Other,
                groupValue: selectedDate,
                onChanged: (value) {},
              ),
            ]),
            TextField(
              decoration: InputDecoration(
                labelText: 'Select Date',
                suffixIcon: IconButton(
                  icon: Icon(Icons.date_range),
                  onPressed: () {
                    // Handle icon button press
                  },
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Select Type',
                suffixIcon: IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    // Handle icon button press
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => History()),
                    );
                  },
                  child: Text('SEARCH')),
            ),
          ]),
        ));
  }
}
