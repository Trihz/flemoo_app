import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  State<History> createState() => _History();
}

class _History extends State<History> {
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
        title: const Center(child: Text('HISTORY')),
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}
