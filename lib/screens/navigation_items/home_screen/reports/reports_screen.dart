import 'package:flutter/material.dart';

class Reports_Screen extends StatefulWidget {
  const Reports_Screen({Key? key}) : super(key: key);

  @override
  State<Reports_Screen> createState() => _Reports_ScreenState();
}

class _Reports_ScreenState extends State<Reports_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Reports',
            style: TextStyle(fontFamily: "sans", color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          // automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            "No Reports Found",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'sans',
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
