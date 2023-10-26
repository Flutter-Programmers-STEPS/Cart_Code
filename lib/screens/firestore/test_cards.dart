import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../firestore_searchbar/firestore_searchbar.dart';
import '../test_screens/addtocart.dart';
import '../test_screens/addtocart/cart3ex.dart';
import '../test_screens/addtocart/cart_screen.dart';

class Test_Card extends StatefulWidget {
  @override
  State<Test_Card> createState() => _Test_CardState();
}

class _Test_CardState extends State<Test_Card> {
  final CollectionReference test =
      FirebaseFirestore.instance.collection('jknj');

  // late final List testName = [];
  // late final List testPrice = [];
  // late final List testDescription = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: InkWell(
            onTap: () {
              showSearch(context: context, delegate: TestSearchPage());
            },
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(237, 237, 237, 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 10, bottom: 2),
                child: Text(
                  'search testes here..',
                  style: TextStyle(
                      fontFamily: 'sans', color: Colors.grey, fontSize: 15),
                ),
              ),
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.black),
                  onPressed: () => () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return AddToCartScreen();
                            },
                          ),
                        );
                      }),
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          // automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
        ),
        body: StreamBuilder(
          stream: test.orderBy('testname').snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.only(left: 13, right: 13, top: 10),
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot testSnap = snapshot.data.docs[index];
                  return Card(
                    elevation: 8,
                    child: Container(
                      height: 180,
                      padding: EdgeInsets.only(
                          left: 12, right: 12, top: 10, bottom: 10),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.bloodtype,
                                            size: 27,
                                            color: Colors.red,
                                          ),
                                          SizedBox(
                                            width: 13,
                                          ),
                                          SizedBox(
                                            width: 210,
                                            // height: 30,
                                            child: Text(
                                              testSnap['testname'],
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
                                      padding: const EdgeInsets.only(
                                          top: 3, bottom: 3),
                                      child: Row(
                                        children: [
                                          Icon(Icons.info),
                                          SizedBox(
                                            width: 13,
                                          ),
                                          Text(
                                            testSnap['parameters'],
                                            style: TextStyle(
                                              fontFamily: 'sans',
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 3, bottom: 3),
                                      child: Row(
                                        children: [
                                          Icon(Icons.settings),
                                          SizedBox(
                                            width: 13,
                                          ),
                                          SizedBox(
                                            width: 210,
                                            height: 30,
                                            child: Text(
                                              testSnap['prepration'],
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
                                    Row(
                                      children: [
                                        Icon(Icons.timer),
                                        SizedBox(
                                          width: 13,
                                        ),
                                        Text(
                                          testSnap['reporttime'],
                                          style: TextStyle(
                                            fontFamily: 'sans',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "DETAILS",
                                      style: TextStyle(
                                        fontFamily: 'sans',
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Price ${testSnap['price']}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'sans',
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 43,
                                  ),
                                  Text(
                                    "|",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 43,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Navigator.of(context).push(
                                      //   MaterialPageRoute(
                                      //     builder: (context) => AddToCartScreen(
                                      //       testName: testSnap['testname'],
                                      //       price: price,
                                      //       description: description,
                                      //     ),
                                      //   ),
                                      // );
                                      Navigator.pushNamed(
                                        context,
                                        '/cart',
                                        arguments: {
                                          'testname': testSnap['testname'],
                                          'testparameters':
                                              testSnap['parameters'],
                                          'pricce': testSnap['price'],
                                        },
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.teal,
                                          content: Text(
                                            'Test added to cart',
                                            style:
                                                TextStyle(fontFamily: 'sans'),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "BOOK NOW",
                                      style: TextStyle(
                                        color: Colors.teal,
                                        fontSize: 12,
                                        fontFamily: 'sans',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              height: 30,
                              width: 290,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10)),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
