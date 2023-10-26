import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import 'location_finder_screen.dart';

class location_appbar extends StatefulWidget {
  const location_appbar({Key? key}) : super(key: key);

  @override
  State<location_appbar> createState() => _location_appbarState();
}

class _location_appbarState extends State<location_appbar> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Location_Finder_Appbar_Screen()),
        );
      },
      child: Container(
        color: Colors.white,
        height: 65, //
        // height: 100, // location works with elevated BUTTON
        child: Padding(
          padding: const EdgeInsets.only(left: 18, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    child: Row(
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
                  ),
                ],
              ),
              SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(left: 3, top: 0),
                  child: Text(
                 "Location here",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 12, fontFamily: 'sans'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _awaitReturnValueFromSecondScreen(BuildContext context) async {
  //   // start the SecondScreen and wait for it to finish with a result
  //   final result = await Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => Location_Finder_Appbar_Screen(),
  //       ));
  //
  //   // after the SecondScreen result comes back update the Text widget with it
  //   setState(() {
  //     text = result;
  //   });
  // }
}
