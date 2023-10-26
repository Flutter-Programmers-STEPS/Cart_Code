import 'dart:ffi';

import 'package:flutter/material.dart';

class Home_Category_Card extends StatelessWidget {
  final String cardid1;
  final IconData cardicon1;
  final double size1;
  final Function()? onTap;
  // final onpressed;
  Home_Category_Card(
    this.cardicon1,
    this.cardid1,
    this.size1,
    this.onTap,
    // this.onpressed,
  );
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 100,
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14))),
              padding:
                  MaterialStatePropertyAll(EdgeInsets.only(left: 13, right: 5)),
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromRGBO(102, 178, 178, 2))),
          onPressed: onTap,
          child: Row(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 89,
                  height: 60,
                  child: Text(
                    cardid1,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Sans',
                        fontSize: size1),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color.fromRGBO(178, 216, 216, 1),
                  // radius: 20,
                  child: Icon(
                    size: 34,
                    cardicon1,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
