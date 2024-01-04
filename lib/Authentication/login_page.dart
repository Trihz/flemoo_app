// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flemoo_app/Authentication/sign_up.dart';
import 'package:flemoo_app/Home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// API PARAMETERS
  String loginURL = "https://devfleemooservice.trackafrik.com/api/session";

  bool isLogging = false;

  String gmail = "";
  String password = "";

  void showSnackBar(String snackbarMessage) {
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
            snackbarMessage,
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
      inAsyncCall: isLogging,
      progressIndicator: const CircularProgressIndicator(
        color: Colors.blue,
        backgroundColor: Colors.white,
        strokeWidth: 5,
      ),
      blurEffectIntensity: 1,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(),
            child: Stack(children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('images/fleemoo.png'),
                          height: 100,
                          width: 400,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 40, 20, 20),
                                child: Column(children: [
                                  const Text(
                                    'SIGN IN',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color:
                                            Color.fromARGB(255, 19, 92, 134)),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                        filled: false, labelText: 'Email'),
                                    onChanged: (value) {
                                      setState(() {
                                        gmail = value;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    decoration: const InputDecoration(
                                        filled: false, labelText: 'Password'),
                                    onChanged: (value) {
                                      setState(() {
                                        password = value;
                                      });
                                    },
                                    obscureText: true,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text('Forgot Password?'),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width: MediaQuery.of(context).size.width *
                                        0.75,
                                    decoration: const BoxDecoration(),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.blue),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white)),
                                      onPressed: () {
                                        authenticateUser(gmail, password);
                                      },
                                      child: const Text('LOGIN'),
                                    ),
                                  ),
                                ])),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('New User?'),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => SignUp())));
                                  },
                                  child: const Text('Sign up'))
                            ])
                      ],
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> authenticateUser(String email, String password) async {
    setState(() {
      isLogging = true;
    });
    final apiUrl = Uri.parse(loginURL);
    String userEmail = "";
    String userName = "";
    int userID = 0;

    try {
      final response = await http.post(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'email': gmail,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> userData = jsonDecode(response.body);
        userEmail = userData['email'];
        userName = userData['name'];
        userID = userData['id'];
        print('Authentication successful.');
        setState(() {
          isLogging = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(
                    userName: userName,
                    userGmail: userEmail,
                    userID: userID,
                  )),
        );
      } else {
        print('Authentication failed. Status code: ${response.statusCode}');
        setState(() {
          isLogging = false;
        });
        showSnackBar("Wrong Gmail or Password");
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLogging = false;
      });
    }
  }
}
