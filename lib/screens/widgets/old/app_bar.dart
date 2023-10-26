import 'package:flutter/material.dart';

class My_appbar extends StatefulWidget {
  const My_appbar({Key? key}) : super(key: key);

  @override
  State<My_appbar> createState() => _My_appbarState();
}

class _My_appbarState extends State<My_appbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 30,
      height: 65,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Icon(
                    size: 18,
                    Icons.home,
                    color: Color.fromRGBO(0, 128, 128, 1.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3, right: 2),
                  child: Text(
                    "Home",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "Comfortaa",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                  size: 22,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3, top: 2),
              child: const Text(
                "Near alain gold soke, kochi",
                style: TextStyle(
                    color: Colors.grey, fontSize: 12, fontFamily: 'Comfortaa'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
