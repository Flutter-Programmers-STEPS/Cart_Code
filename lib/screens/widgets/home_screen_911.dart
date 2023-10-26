import 'package:flutter/material.dart';

class Nine_11_Comment extends StatelessWidget {
  const Nine_11_Comment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, top: 55),
      child: Text(
        'With <3 from \nnine11',
        style: TextStyle(
          color: Colors.grey,
          fontFamily: "Rammetto",
          fontSize: 25,
        ),
      ),
    );
  }
}
