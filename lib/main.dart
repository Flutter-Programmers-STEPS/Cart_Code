import 'dart:async';

import 'package:chemist_io3/screens/firestore/test_cards.dart';
import 'package:chemist_io3/screens/google/screeens/login_page.dart';
import 'package:chemist_io3/screens/location-plugin/location-screen.dart';
import 'package:chemist_io3/screens/navigation_items/articles_screen.dart';
import 'package:chemist_io3/screens/navigation_items/categories_screen.dart';
import 'package:chemist_io3/screens/navigation_items/home_screen/book_a_test_screen.dart';
import 'package:chemist_io3/screens/navigation_items/home_screen/home_screen.dart';
import 'package:chemist_io3/screens/navigation_items/navigation_bar.dart';
import 'package:chemist_io3/screens/navigation_items/settings_screen/settings_screen.dart';
import 'package:chemist_io3/screens/signup_page.dart';
import 'package:chemist_io3/screens/splash_screen/logo_splash_screen.dart';
import 'package:chemist_io3/screens/splash_screen/splash_screen.dart';
import 'package:chemist_io3/screens/test_screens/addtocart.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/home": (context) => Home_screen(),
        "/catagory": (context) => categories_screen(),
        "/cart": (context) => AddToCartScreen(),
        "/act": (context) => account_screen(),
        "/articles": (context) => Articles_Screennn(),
      },
      home: Navigation_Bar(),
      // home: LoginScreen(),
    );
  }
}
