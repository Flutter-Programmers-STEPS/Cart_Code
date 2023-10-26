import 'package:flutter/material.dart';

class About_screen extends StatefulWidget {
  const About_screen({Key? key}) : super(key: key);

  @override
  State<About_screen> createState() => _About_screenState();
}

class _About_screenState extends State<About_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 12, right: 12, top: 50),
          children: [
            Text(
              "about Chemist.io",
              style: TextStyle(
                  fontFamily: 'Monts', fontSize: 55, color: Colors.grey),
            ),
            Text(
              "Version 1.9.0.1",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            Text(
              "Chemist is powered by nine-11! \nConcept by Kabeer @NineEleven",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            Text(
              "Support/feedback email",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
