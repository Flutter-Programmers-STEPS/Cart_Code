import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../firestore/test_cards.dart';
import 'Camera_screen.dart';
import '../../test_screens/open_from_gallery.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Book_A_Test extends StatefulWidget {
  Book_A_Test({Key? key}) : super(key: key);

  @override
  State<Book_A_Test> createState() => _Book_A_TestState();
}

class _Book_A_TestState extends State<Book_A_Test> {
  File? galleryFile;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sample Collection',
          style: TextStyle(fontFamily: "sans", color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      scrollable: true,
                      content: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                _showPicker(context: context);
                              },
                              child: Text(
                                "Open from gallery",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'sans',
                                    fontSize: 15),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                padding: MaterialStatePropertyAll(
                                  EdgeInsets.only(
                                      left: 20, right: 20, top: 13, bottom: 13),
                                ),
                                backgroundColor: MaterialStatePropertyAll(
                                  Color.fromRGBO(0, 128, 128, 1.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return CameraScreen();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                "Take photo",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'sans',
                                    fontSize: 15),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                padding: MaterialStatePropertyAll(
                                  EdgeInsets.only(
                                      left: 40, right: 40, top: 13, bottom: 13),
                                ),
                                backgroundColor: MaterialStatePropertyAll(
                                  Color.fromRGBO(0, 128, 128, 1.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'sans',
                                    fontSize: 15),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                padding: MaterialStatePropertyAll(
                                  EdgeInsets.only(
                                      left: 52, right: 52, top: 13, bottom: 13),
                                ),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white
                                        // Color.fromRGBO(0, 128, 128, 1.0),
                                        ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                "Upload Prescription",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'sans', fontSize: 18),
              ),
              style: ButtonStyle(
                padding: MaterialStatePropertyAll(
                  EdgeInsets.only(left: 25, right: 25, top: 17, bottom: 17),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromRGBO(0, 128, 128, 1.0),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Test_Card();
                    },
                  ),
                );
              },
              child: Text(
                "Search tests",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'sans', fontSize: 18),
              ),
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                padding: MaterialStatePropertyAll(
                  EdgeInsets.only(left: 52, right: 52, top: 17, bottom: 17),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromRGBO(0, 128, 128, 1.0),
                ),
              ),
            ),
            // SizedBox(
            //   height: 200.0,
            //   width: 300.0,
            //   child: galleryFile == null
            //       ? const Center(child: Text('Sorry nothing selected!!'))
            //       : Center(child: Image.file(galleryFile!)),
            // ),
          ],
        ),
      ),
    );
  }

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }
}
