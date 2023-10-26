import 'package:chemist_io3/screens/navigation_items/home_screen/reports/reports_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../firestore_searchbar/firestore_searchbar.dart';
import 'near_by_labs/near_by_labs_finder.dart';
import '../../widgets/home_category_card.dart';
import '../../widgets/scroll_ad_banner.dart';
import '../../widgets/search_bar.dart';
import 'book_a_test_screen.dart';
import 'health_records/healrh_record_screen.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  static final home = "home";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Text(
              "Chemist.io",
              style: TextStyle(
                fontSize: 22, fontFamily: "Monts",
                color: Color.fromRGBO(0, 128, 128, 1.0),
                // color: Color.fromRGBO(0, 128, 128, 1.0),
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15)),
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 0, right: 0),
          children: [
            // location_appbar(),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, right: 17, left: 17, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(237, 237, 237, 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TextField(
                    style: TextStyle(fontFamily: 'sans'),
                    cursorColor: Colors.teal,
                    onTap: () {
                      showSearch(context: context, delegate: TestSearchPage());
                    },
                    decoration: InputDecoration(
                      hoverColor: Colors.teal,
                      fillColor: Colors.black,
                      hintText: "Search test here",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'sans',
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // SearchBar(),
            AutoScrollBanner(
              duration: Duration(seconds: 4),
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5, left: 2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/front_banner/banner_ad2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 2),
                  child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/front_banner/banner_40.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            My_Search_bar(),
            //search bar
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Home_Category_Card(
                          Icons.home_outlined,
                          'Book home sample collection',
                          15,
                          () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Book_A_Test();
                                },
                              ),
                            );
                          },
                        ),
                        // Home_Category_Card(cardicon1, cardid1, 15, No_Internet_Screen()),
                        SizedBox(
                          width: 11,
                        ),
                        Home_Category_Card(
                          Icons.textsms,
                          'Reports',
                          16,
                          () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Reports_Screen();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 8),
                    child: Row(
                      children: [
                        Home_Category_Card(
                          Icons.location_on,
                          'Find near by labs',
                          16,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Near_by_Lab_Location()),
                            );
                          },
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Home_Category_Card(
                          Icons.cloud_upload_outlined,
                          'Health Records',
                          16,
                          () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  // return HealthRecordScreen();
                                  return Health_Record_Screen();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Nine_11_Comment(),
            // CircleSkeleton(size: 50),
            // Skeleton(
            //   height: 50,
            //   width: 50,
            // ),
          ],
        ),
      ),
    );
  }
}
