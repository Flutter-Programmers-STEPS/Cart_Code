import 'dart:async';
import 'package:flutter/material.dart';
import '../front_login_signup_screen.dart';

class Logo_Screen extends StatefulWidget {
  const Logo_Screen({Key? key}) : super(key: key);
  @override
  State<Logo_Screen> createState() => _Logo_ScreenState();
}

class _Logo_ScreenState extends State<Logo_Screen> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(0, 128, 128, 1.0),
        body: Center(
          child: Text(
            "chemist",
            style: TextStyle(
                fontFamily: "Monts", fontSize: 45, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
