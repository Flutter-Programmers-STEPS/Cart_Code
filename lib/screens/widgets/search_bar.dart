import 'package:flutter/material.dart';

class My_Search_bar extends StatefulWidget {
  const My_Search_bar({Key? key}) : super(key: key);

  @override
  State<My_Search_bar> createState() => _My_Search_barState();
}

class _My_Search_barState extends State<My_Search_bar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 20, bottom: 10),
      child: Text(
        "What are you looking for?",
        style: TextStyle(
            fontFamily: 'Comfortaa', fontSize: 17, fontWeight: FontWeight.w800),
      ),
    );
  }
}
