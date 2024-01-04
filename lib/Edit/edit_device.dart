import 'package:flutter/material.dart';

class EditDevice extends StatefulWidget {
  @override
  State<EditDevice> createState() => _EditDevice();
}

enum Device {
  man,
  woman,
  pregnantWoman,
  elderlyPerson,
  child,
  disabledPeople,
  animal,
  car,
  bike,
  truck
}

Device selectedDevice = Device.car;

class _EditDevice extends State<EditDevice> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    //bool switchValue = false;

    // TODO: implement build
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
        title: Center(child: Text('EDIT DEVICE')),
        foregroundColor: Colors.white,
        backgroundColor: theme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const TextField(
            decoration: InputDecoration(filled: false, labelText: 'GPS Name'),
          ),
          const TextField(
            decoration:
                InputDecoration(filled: false, labelText: 'GPS Description'),
          ),
          const TextField(
            decoration:
                InputDecoration(filled: false, labelText: 'GPS Phone Number'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Auto Geofence When Stop'),
              Switch(value: true, onChanged: (switchValue) {})
            ],
          ),
          Text('Icon'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                RadioListTile<Device>(
                  title: Row(children: [
                    Icon(
                      Icons.man,
                      color: theme.primaryColor,
                    ),
                    Text('Man')
                  ]),
                  value: Device.man,
                  groupValue: selectedDevice,
                  onChanged: (value) {},
                ),
                RadioListTile<Device>(
                  title: Row(children: [
                    Icon(
                      Icons.face,
                      color: theme.primaryColor,
                    ),
                    Text('Woman')
                  ]),
                  value: Device.woman,
                  groupValue: selectedDevice,
                  onChanged: (value) {},
                ),
                RadioListTile<Device>(
                  title: Row(children: [
                    Icon(
                      Icons.pregnant_woman,
                      color: theme.primaryColor,
                    ),
                    Text('Pregnant Woman')
                  ]),
                  value: Device.pregnantWoman,
                  groupValue: selectedDevice,
                  onChanged: (value) {},
                ),
                RadioListTile<Device>(
                  title: Row(children: [
                    Icon(
                      Icons.elderly,
                      color: theme.primaryColor,
                    ),
                    Text('Elderly Person')
                  ]),
                  value: Device.elderlyPerson,
                  groupValue: selectedDevice,
                  onChanged: (value) {},
                ),
                RadioListTile<Device>(
                  title: Row(children: [
                    Icon(
                      Icons.child_care,
                      color: theme.primaryColor,
                    ),
                    Text('Child')
                  ]),
                  value: Device.child,
                  groupValue: selectedDevice,
                  onChanged: (value) {},
                ),
                RadioListTile<Device>(
                  title: Row(children: [
                    Icon(
                      Icons.accessible,
                      color: theme.primaryColor,
                    ),
                    Text('Disabled People')
                  ]),
                  value: Device.disabledPeople,
                  groupValue: selectedDevice,
                  onChanged: (value) {},
                ),
                RadioListTile<Device>(
                  title: Row(children: [
                    Icon(
                      Icons.pets,
                      color: theme.primaryColor,
                    ),
                    Text('Animal')
                  ]),
                  value: Device.animal,
                  groupValue: selectedDevice,
                  onChanged: (value) {},
                ),
                RadioListTile<Device>(
                  title: Row(children: [
                    Icon(
                      Icons.directions_car,
                      color: theme.primaryColor,
                    ),
                    Text('Car')
                  ]),
                  value: Device.car,
                  groupValue: selectedDevice,
                  onChanged: (value) {},
                ),
                RadioListTile<Device>(
                  title: Row(children: [
                    Icon(
                      Icons.two_wheeler,
                      color: theme.primaryColor,
                    ),
                    Text('Bike')
                  ]),
                  value: Device.bike,
                  groupValue: selectedDevice,
                  onChanged: (value) {},
                ),
                RadioListTile<Device>(
                  title: Row(children: [
                    Icon(
                      Icons.local_shipping,
                      color: theme.primaryColor,
                    ),
                    Text('Truck')
                  ]),
                  value: Device.truck,
                  groupValue: selectedDevice,
                  onChanged: (value) {},
                ),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
