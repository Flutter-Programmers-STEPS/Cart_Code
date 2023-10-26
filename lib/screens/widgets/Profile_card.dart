import 'package:flutter/material.dart';

class Profile_Card extends StatelessWidget {
  final String label;

  const Profile_Card({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 3),
      child: Container(
        padding: EdgeInsets.only(right: 14, left: 14),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, bottom: 2),
              child: SizedBox(
                width: 270,
                child: Text(
                  label,
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Sans",
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                size: 12,
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        height: 37,
        decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
      ),
    );
  }
}
