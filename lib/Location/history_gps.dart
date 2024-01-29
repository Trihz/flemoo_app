import 'package:flutter/material.dart';

import 'history.dart';

class HistoryGps extends StatefulWidget {
  @override
  State<HistoryGps> createState() => _HistoryGps();
}

enum HistoryDate { Today, Yesterday, Other }

HistoryDate selectedDate = HistoryDate.Other;

class _HistoryGps extends State<HistoryGps> {
  Color mainColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Center(child: Text('HISTORY GPS')),
          backgroundColor: mainColor,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Icon'),
            Column(children: [
              RadioListTile<HistoryDate>(
                title: const Row(children: [Text('Today')]),
                value: HistoryDate.Today,
                groupValue: selectedDate,
                onChanged: (value) {},
              ),
              RadioListTile<HistoryDate>(
                title: const Row(children: [Text('Yesterday')]),
                value: HistoryDate.Yesterday,
                groupValue: selectedDate,
                onChanged: (value) {},
              ),
              RadioListTile<HistoryDate>(
                title: const Row(children: [Text('Other')]),
                value: HistoryDate.Other,
                groupValue: selectedDate,
                onChanged: (value) {},
              ),
            ]),
            TextField(
              decoration: InputDecoration(
                labelText: 'Select Date',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.date_range),
                  onPressed: () {},
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Select Type',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => History())));
                  },
                  child: const Text('SEARCH')),
            ),
          ]),
        ));
  }
}
