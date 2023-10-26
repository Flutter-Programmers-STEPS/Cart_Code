import 'package:flutter/material.dart';

import '../firestore/test_cards.dart';

class Cart_Screen extends StatefulWidget {
  const Cart_Screen({Key? key}) : super(key: key);

  @override
  State<Cart_Screen> createState() => _Cart_ScreenState();
}

class _Cart_ScreenState extends State<Cart_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.only(top: 250),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Your basket is empty!",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Comfortaa",
                      color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 5),
                  child: Text(
                    "Enjoy Upto 40% Savings on Tests",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: "Comfortaa",
                        color: Colors.grey),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Test_Card()),
                    );
                  },
                  child: Text(
                    'Book Now',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Color.fromRGBO(0, 128, 128, 1.0),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
