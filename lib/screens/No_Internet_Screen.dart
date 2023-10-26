import 'package:flutter/material.dart';

class No_Internet_Screen extends StatefulWidget {
  const No_Internet_Screen({Key? key}) : super(key: key);

  @override
  State<No_Internet_Screen> createState() => _No_Internet_ScreenState();
}

class _No_Internet_ScreenState extends State<No_Internet_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.only(top: 110, left: 15, right: 15),
          children: [
            Center(
              child: Image(image: AssetImage('assets/images/no_internet.png')),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "WE'RE UNABLE TO LOAD PAGE DATA",
                  style: TextStyle(
                      fontFamily: 'Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 21),
                ),
                Text(
                  "Please chek your internet connection or try again later",
                  style: TextStyle(
                      fontFamily: 'Sans',
                      fontWeight: FontWeight.normal,
                      fontSize: 13.5),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
