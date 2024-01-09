import 'package:flutter/material.dart';

class AddGeofenceDetails extends StatefulWidget {
  const AddGeofenceDetails({super.key});

  @override
  State<AddGeofenceDetails> createState() => _AddGeofenceDetailsState();
}

class _AddGeofenceDetailsState extends State<AddGeofenceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 1,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      hintText: "Geofence Name",
                      contentPadding: EdgeInsets.all(10.0),
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    maxLines: 20,
                    decoration: const InputDecoration(
                      hintText: "Geofence Description",
                      contentPadding: EdgeInsets.all(10.0),
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: ElevatedButton(onPressed: () {}, child: Text("DONE")),
          )
        ],
      ),
    );
  }
}
