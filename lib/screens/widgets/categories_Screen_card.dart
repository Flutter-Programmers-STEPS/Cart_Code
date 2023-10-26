import 'package:flutter/material.dart';

class Category_Screen_Card extends StatelessWidget {
  final String title;
  final double size1;
  final String card_image;

  Category_Screen_Card(
    this.title,
    this.size1,
    this.card_image,
  );
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 157,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: Color.fromRGBO(0, 128, 128, 1.0),
          ),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 128, 128, 1.0),
              Color.fromRGBO(0, 128, 128, 1.0),
            ],
          ),
          color: Color.fromRGBO(0, 128, 128, 1.0),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 16, bottom: 7),
              child: SizedBox(
                width: 80,
                height: 70,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Urbanist',
                      fontSize: size1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 9, left: 0, bottom: 13),
              child: SizedBox(
                width: 55,
                height: 55,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image(
                    fit: BoxFit.fill,
                    color: Colors.white.withOpacity(0.25),
                    image: AssetImage(card_image),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
