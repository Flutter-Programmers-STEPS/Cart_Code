import 'package:chemist_io3/screens/phone%20number%20auth/phone_login_page.dart';
import 'package:chemist_io3/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'login_page_with_number.dart';
import 'navigation_items/navigation_bar.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(0, 128, 128, 1.0),
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Text(
                  "chemist",
                  style: TextStyle(
                      fontFamily: "Monts", fontSize: 45, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lato',
                            fontSize: 16,
                          ),
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.only(
                              top: 6, bottom: 6, left: 50, right: 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadowColor: Colors.black),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const signup_page()),
                        );
                      },
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Color.fromRGBO(0, 128, 128, 1.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Phone_Login_page()),
                          );
                        },
                        child: Text(
                          "LOG IN",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              fontFamily: 'Lato',
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
