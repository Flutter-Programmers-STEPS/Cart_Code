import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/categories_Screen_card.dart';
import '../widgets/Category_Screen_Last_card.dart';
import '../widgets/home_category_card.dart';

class categories_screen extends StatefulWidget {
  static final id = "catagory";

  const categories_screen({Key? key}) : super(key: key);

  @override
  State<categories_screen> createState() => _categories_screenState();
}

class _categories_screenState extends State<categories_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.only(top: 50, left: 15, right: 15),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 3.5,
                bottom: 20,
              ),
              child: const Text(
                'Categories',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'Comfortaa'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: [
                  Category_Screen_Card("Acidity", 17,
                      "assets/images/category_screen_icons/stomach.png"),
                  SizedBox(
                    width: 11,
                  ),
                  Category_Screen_Card("Allergy", 17,
                      "assets/images/category_screen_icons/allergyy.png"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: [
                  Category_Screen_Card("Anaemia", 17,
                      "assets/images/category_screen_icons/anaemiaa.png"),
                  SizedBox(
                    width: 11,
                  ),
                  Category_Screen_Card("Arthritis", 17,
                      "assets/images/category_screen_icons/arthritiss.png")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: [
                  Category_Screen_Card("Bone", 17,
                      "assets/images/category_screen_icons/bonee.png"),
                  SizedBox(
                    width: 11,
                  ),
                  Category_Screen_Card("Cancer", 17,
                      "assets/images/category_screen_icons/cancerr.png"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: [
                  Category_Screen_Card("Diabetes", 17,
                      "assets/images/category_screen_icons/diabetess.png"),
                  SizedBox(
                    width: 11,
                  ),
                  Category_Screen_Card("Digestion", 17,
                      "assets/images/category_screen_icons/digestionn.png"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: [
                  Category_Screen_Card("Fatigue", 17,
                      "assets/images/category_screen_icons/fatigue.png"),
                  SizedBox(
                    width: 11,
                  ),
                  Category_Screen_Card("Fever", 17,
                      "assets/images/category_screen_icons/fever.png"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: [
                  Category_Screen_Card("Heart", 17,
                      "assets/images/category_screen_icons/heart.png"),
                  SizedBox(
                    width: 11,
                  ),
                  Category_Screen_Card("Hepatits", 17,
                      "assets/images/category_screen_icons/hepatitis.png"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: [
                  Category_Screen_Card("Hormones", 17,
                      "assets/images/category_screen_icons/hormones.png"),
                  SizedBox(
                    width: 11,
                  ),
                  Category_Screen_Card("Hypertension", 13,
                      "assets/images/category_screen_icons/hypertension.png"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: [
                  Category_Screen_Card("Immunity", 17,
                      "assets/images/category_screen_icons/immune-system.png"),
                  SizedBox(
                    width: 11,
                  ),
                  Category_Screen_Card("Infections", 17,
                      "assets/images/category_screen_icons/infection.png"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: [
                  Category_Screen_Card("Jaundice", 17,
                      "assets/images/category_screen_icons/jaundice.png"),
                  SizedBox(
                    width: 11,
                  ),
                  Category_Screen_Card("Joints", 17,
                      "assets/images/category_screen_icons/knee.png"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: [
                  Category_Screen_Card("Kidney", 17,
                      "assets/images/category_screen_icons/kidney.png"),
                  SizedBox(
                    width: 11,
                  ),
                  Category_Screen_Card("Liver", 17,
                      "assets/images/category_screen_icons/liver.png"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: Row(
                children: [
                  Category_Screen_Card("Obesity", 17,
                      "assets/images/category_screen_icons/obesity.png"),
                  SizedBox(
                    width: 11,
                  ),
                  Category_Screen_Card("Pregnancy", 16,
                      "assets/images/category_screen_icons/pregnant.png"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 11),
              child: Row(
                children: [
                  Category_Screen_Card(
                      "STD", 18, "assets/images/category_screen_icons/std.png"),
                  SizedBox(
                    width: 11,
                  ),
                  Category_Screen_Card("Thyroid", 17,
                      "assets/images/category_screen_icons/thyroid.png"),
                ],
              ),
            ),
            Category_Screen_Last_Card("Vitamins", 20,
                "assets/images/category_screen_icons/vitamins.png")
          ],
        ),
      ),
    );
  }
}
