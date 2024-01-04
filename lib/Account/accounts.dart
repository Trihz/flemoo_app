// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, avoid_print

import 'package:flemoo_app/Account/edit_account.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AccountDetails extends StatefulWidget {
  String userName = "";
  String userGmail = "";
  int userID = 0;
  AccountDetails(
      {required this.userName,
      required this.userGmail,
      required this.userID,
      super.key});

  @override
  State<AccountDetails> createState() => _AccountDetails();
}

class _AccountDetails extends State<AccountDetails> {
  @override
  void initState() {
    super.initState();
  }

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
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => EditAccount(
                              userID: widget.userID,
                            ))));
              },
              child: Text('Edit')),
          SizedBox(width: 10)
        ],
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Column(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                children: const [
                  Image(
                    image: AssetImage('images/fleemoo.png'),
                    height: 80,
                    width: 400,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(
                          width: 10,
                        ),
                        Text(widget.userName,
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.userGmail,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.phone),
                        SizedBox(
                          width: 10,
                        ),
                        Text('+62811888999',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
          Positioned(
            top: 150.0,
            left: 140.0,
            child: Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
                image: DecorationImage(
                  image: AssetImage('images/coffee.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )

          // Other widgets in the Stack
        ],
      ),
    );
  }
}
