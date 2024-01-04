// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flemoo_app/Authentication/login_page.dart';
import 'package:flemoo_app/Authentication/sign_up_logic.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String userName = "";
  String userEmail = "";
  String userPassword = "";
  bool isRegistering = false;

  String registerUserURL = "https://devfleemooservice.trackafrik.com/api/users";

  /// REGISTRATION WIDGET
  Widget registrationWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset("images/fleemoo.png"),
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: const Center(
              child: Text(
            "Register",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w800, fontSize: 20),
          )),
        ),
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Text(
                "Name",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    userName = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: "Enter your name",
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
          ],
        ),
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Text(
                "Gmail",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    userEmail = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: "Enter your gmail",
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
          ],
        ),
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Text(
                "Password",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    userPassword = value;
                  });
                },
                decoration: const InputDecoration(
                  hintText: "Enter your password",
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
          ],
        ),
        ElevatedButton(
          onPressed: () {
            if (userName.isEmpty || userName.isEmpty || userPassword.isEmpty) {
              showSnackBar("Please enter all the fields");
            } else {
              registerNewUser();
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: const Text(
            "REGISTER",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w900, fontSize: 15),
          ),
        )
      ],
    );
  }

  /// SNACKBAR
  void showSnackBar(String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.blue,
      padding: const EdgeInsets.all(0),
      duration: const Duration(milliseconds: 1500),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 1,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Center(
          child: Text(
            message,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15),
          ),
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
        inAsyncCall: isRegistering,
        progressIndicator: const CircularProgressIndicator(
          color: Colors.blue,
          backgroundColor: Colors.white,
          strokeWidth: 5,
        ),
        child: Scaffold(
          body: Center(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: registrationWidget()),
          ),
        ));
  }

  /// REGISTER
  Future<void> registerNewUser() async {
    setState(() {
      isRegistering = true;
    });
    final newUser = SignUpLogic(
        userName: userName, userEmail: userEmail, userPassword: userPassword);
    final apiUrl = Uri.parse(registerUserURL);

    try {
      final response = await http.post(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(newUser.toJson()),
      );

      if (response.statusCode == 200) {
        String registerResponse = response.body;
        print(registerResponse);
        print('User registered successfully');
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const LoginPage())));
        setState(() {
          isRegistering = false;
        });
      } else {
        print('Failed to register user. Status code: ${response.statusCode}');
        print(response.body);
        setState(() {
          isRegistering = false;
        });
        showSnackBar("Failed to register user");
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isRegistering = false;
      });
    }
  }
}
