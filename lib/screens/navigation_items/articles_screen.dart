import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Articles_Screennn extends StatefulWidget {
  static final id = "articles";
  @override
  State<Articles_Screennn> createState() => _Articles_ScreennnState();
}

class _Articles_ScreennnState extends State<Articles_Screennn> {
  void initState() {
    super.initState();
    readData();
  }

  bool isLoading = true;
  List<String> title = [];
  List<String> description = [];
  List<String> imageurl = [];
  List<String> blogUrl = [];
  List<String> time = [];

  Future<void> readData() async {
    var url =
        "https://chemist3-be30d-default-rtdb.firebaseio.com/" + "blogs.json";
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((blogId, blogData) {
        title.add(blogData["title"]);
        description.add(blogData["description"]);
        imageurl.add(blogData["url"]);
        blogUrl.add(blogData["blogurl"]);
        time.add(blogData["time"]);
      });
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.teal,
        title: Text(
          "Articles",
          style:
              TextStyle(color: Colors.white, fontFamily: "sans", fontSize: 20),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
              itemCount: title.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 8,
                  child: InkWell(
                    onTap: () async {
                      String url = blogUrl[index];
                      await launchUrl(Uri.parse(url));
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 135,
                              child: Image.network('${imageurl[index]}',
                                  height: 150, width: 100, fit: BoxFit.fill),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 3, bottom: 3),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 3,
                                    ),
                                    SizedBox(
                                      child: Text(
                                        time[index],
                                        style: TextStyle(
                                          fontFamily: 'sans',
                                          color: Colors.teal,
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: SizedBox(
                                        child: Text(
                                          title[index],
                                          style: TextStyle(
                                            fontFamily: 'sans',
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        height: 52,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 46,
                                      child: Text(
                                        description[index],
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Row(
                                        children: [
                                          Text(
                                            "READ MORE",
                                            style: TextStyle(
                                                fontSize: 9,
                                                color: Colors.teal,
                                                fontFamily: "sans"),
                                          ),
                                          Icon(
                                            size: 10,
                                            Icons.arrow_forward,
                                            color: Colors.teal,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
