import 'package:flemoo_app/Authentication/login_page.dart';
import 'package:flemoo_app/test.dart';
import 'package:flemoo_app/test2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Test2()
        //home: LoginPage(),
        );
  }
}
