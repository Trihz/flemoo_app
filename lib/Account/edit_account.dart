// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flemoo_app/Authentication/login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditAccount extends StatefulWidget {
  int userID = 0;
  EditAccount({required this.userID, super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  /// MAIN COLORS
  Color mainColor = Colors.blue;

  var usernameAuth = 'admin';
  var passwordAuth = 'AdminFleemoo1234';

  bool isLoggingOut = false;

  /// DELETE CONTAINER
  Widget deleteContainer() {
    return GestureDetector(
      onTap: () {
        confirmDelete(context);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: const Offset(0, 2),
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Delete Account",
              style: TextStyle(color: Colors.red, fontSize: 17),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            const Icon(
              Icons.delete,
              size: 30,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    print(widget.userID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
        progressIndicator: const CircularProgressIndicator(
          color: Colors.blue,
          backgroundColor: Colors.white,
          strokeWidth: 5,
        ),
        blurEffectIntensity: 1,
        inAsyncCall: isLoggingOut,
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                deleteContainer()
              ],
            ),
          ),
        ));
  }

  /// DELETE ALERT
  void confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ElevatedButton(
                      onPressed: (() {
                        deleteUser(78);
                      }),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      child: const Text("CONFIRM")),
                ),
              )),
        );
      },
    );
  }

  Future<void> deleteUser(int userId) async {
    final apiUrl =
        Uri.parse('https://devfleemooservice.trackafrik.com/api/users/$userId');

    try {
      final credentials = '$usernameAuth:$passwordAuth';
      final basicAuth = 'Basic ${base64Encode(utf8.encode(credentials))}';

      final response = await http.delete(
        apiUrl,
        headers: <String, String>{
          'Authorization': basicAuth,
        },
      );

      if (response.statusCode == 204) {
        print('User deleted successfully');
        Navigator.pop(context);
        setState(() {
          isLoggingOut = true;
        });
        Timer(const Duration(seconds: 3), () {
          setState(() {
            isLoggingOut = false;
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => const LoginPage())));
          });
        });
      } else {
        print('Failed to delete user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
