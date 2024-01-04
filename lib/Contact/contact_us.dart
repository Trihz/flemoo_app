import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  State<ContactUs> createState() => _ContactUs();
}

class _ContactUs extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image(
                      image: AssetImage('images/fleemoo.png'),
                      height: 60,
                      width: 300,
                    ),
                  )
                ],
              ),
            ),
            Container(
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
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.close,
                                  color: theme.primaryColor,
                                )
                              ],
                            ),
                            const Text(
                              'CONTACT US',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Color.fromARGB(255, 19, 92, 134)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                  filled: false, labelText: 'Name'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                  filled: false, labelText: 'Email'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                  filled: false, labelText: 'Message'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white)),
                                onPressed: () {},
                                child: const Text('SUBMIT'),
                              ),
                            ),
                          ])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.email,
                                color: theme.primaryColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'cs@email.com',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 19, 92, 134)),
                                  )
                                ],
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.phone_android,
                                color: theme.primaryColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Phone',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '+62 811 888 888',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 19, 92, 134)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ]),
                  )
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
