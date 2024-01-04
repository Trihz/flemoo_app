import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  State<History> createState() => _History();
}

class _History extends State<History> {
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
        title: Center(child: Text('HISTORY')),
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}
