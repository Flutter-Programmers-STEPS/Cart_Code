import 'package:flutter/material.dart';

import '../forget_password_screen.dart';
import '../front_login_signup_screen.dart';
import '../login_page_with_number.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(top: 60),
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 330,
                    height: 350,
                    child: Image(
                      image: AssetImage(
                        'assets/images/frontScreen.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 309,
                    height: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Text(
                            "Keep track of all your health information in one convenient place",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Alata',
                                color: Colors.black,
                                fontSize: 23),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            "We provides a well organized and precompiled database that you can integrate at any moment",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Alata',
                                color: Colors.grey,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton.icon(
                          //icon data for elevated butto
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.only(
                                  top: 8, bottom: 8, left: 7, right: 16),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Color.fromRGBO(0, 128, 128, 1.0)),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            );
                          },
                          label: const Text("Get Started"),
                          icon: const Icon(Icons.navigate_next_outlined),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
