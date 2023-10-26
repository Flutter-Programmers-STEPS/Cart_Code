import 'package:chemist_io3/screens/google/authentication/googleee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestSearchPage extends SearchDelegate {
  CollectionReference _firebaseFirestore =
      FirebaseFirestore.instance.collection("jknj");

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  final String? title = "";
  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firebaseFirestore.snapshots().asBroadcastStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.data!.docs
                .where((QueryDocumentSnapshot<Object?> element) =>
                    element['testname']
                        .toString()
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                .isEmpty) {
              return Center(
                child: Text(
                  "No result found",
                  style: TextStyle(fontFamily: 'sans'),
                ),
              );
            } else {
              return ListView(
                children: [
                  ...snapshot.data!.docs
                      .where((QueryDocumentSnapshot<Object?> element) =>
                          element['testname']
                              .toString()
                              .toLowerCase()
                              .contains(query.toLowerCase()))
                      .map((QueryDocumentSnapshot<Object?> data) {
                    final String testname = data.get('testname');
                    final String prepration = data['prepration'];
                    final String parameters = data['parameters'];
                    final String time = data['reporttime'];
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
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
                                                testname,
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
                                              parameters,
                                              style: TextStyle(
                                                fontSize: 12,
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
                                                prepration,
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
                                            time,
                                            style:
                                                TextStyle(fontFamily: 'sans'),
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
                                      'Price',
                                      style: TextStyle(
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
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.teal,
                                            content: Text(
                                              'Sorry cart is being build by developer ! :(',
                                              style:
                                                  TextStyle(fontFamily: 'sans'),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "ADD",
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
                    //   ListTile(
                    //   onTap: () {
                    //     Text(title);
                    //   },
                    //   title: Text(
                    //     title,
                    //     style: TextStyle(fontFamily: 'sans'),
                    //   ),
                    //   subtitle: Text(
                    //     time,
                    //     style: TextStyle(fontFamily: 'sans'),
                    //   ),
                    // );
                  })
                ],
              );
            }

            /// fetch here
            // print(snapshot.data);
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center();
  }
}
