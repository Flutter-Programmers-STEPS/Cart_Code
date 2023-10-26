import 'package:flutter/material.dart';

class AddToCartScreen extends StatelessWidget {
  static final id = "cart";

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String testName = arguments['testname'];
    final String testPrice = arguments['pricce'];
    final String testDescription = arguments['testparameters'];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: Text(
            'Test Cart',
            style: TextStyle(fontFamily: "sans"),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 10, right: 12, left: 12),
          children: [
            Card(
              elevation: 8,
              child: Container(
                height: 120,
                padding:
                    EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.bloodtype,
                                      size: 25,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      // height: 30,
                                      child: Text(
                                        testName,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'sans',
                                            color: Colors.teal),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 6, bottom: 6),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.settings,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      height: 20,
                                      child: Text(
                                        testDescription,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'sans',
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 3, bottom: 3),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.currency_rupee,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      testPrice,
                                      style: TextStyle(
                                        fontFamily: 'sans',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text("BUY NOW"),
            ),
            // Text(testName),
            // Text(testPrice),
            // // Text(testPrice.toString()),
            // Text(testDescription),
            // // Add quantity selector and "Add to Cart" button
          ],
        ),
      ),
    );
  }
}
