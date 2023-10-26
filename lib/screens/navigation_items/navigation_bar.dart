import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../test_screens/addtocart.dart';
import '../test_screens/addtocart/cart_screen.dart';
import '../test_screens/addtocart/gpt_add_to_screen.dart';
import '../test_screens/product_screen.dart';
import 'Cart_screen.dart';
import 'articles_screen.dart';
import 'categories_screen.dart';
import 'home_screen/home_screen.dart';
import 'settings_screen/settings_screen.dart';

class Navigation_Bar extends StatefulWidget {
  @override
  _Navigation_BarState createState() => _Navigation_BarState();
}

class _Navigation_BarState extends State<Navigation_Bar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: bottomNavigationBar(),
      ),
    );
  }

  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Home_screen(), //home
    const categories_screen(),
    const Cart_Screen(),
    //cart
    // AddToCartScreen(),

    Articles_Screennn(), // articles
    // ProductScreen(),
    // CartScreen(),
    const account_screen(), // //profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget bottomNavigationBar() {
    return SalomonBottomBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        SalomonBottomBarItem(
          icon: Icon(Icons.home_outlined),
          title: Text(
            "Home",
            style: TextStyle(fontSize: 12, fontFamily: 'alata'),
          ),
          selectedColor: Colors.grey,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.category_outlined),
          title: Text(
            "Categories",
            style: TextStyle(fontSize: 11, fontFamily: 'alata'),
          ),
          selectedColor: Colors.grey,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          title: Text(
            "Cart",
            style: TextStyle(fontSize: 11, fontFamily: 'alata'),
          ),
          selectedColor: Colors.grey,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.article_outlined),
          title: Text(
            "Articles",
            style: TextStyle(fontSize: 11, fontFamily: 'alata'),
          ),
          selectedColor: Colors.grey,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.account_circle),
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 12, fontFamily: 'alata'),
          ),
          selectedColor: Colors.grey,
        ),
      ],
    );
  }
}
