import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'dart:io';

import '../Camera_screen.dart';

class Health_Record_Screen extends StatefulWidget {
  const Health_Record_Screen({Key? key}) : super(key: key);

  @override
  State<Health_Record_Screen> createState() => _Health_Record_ScreenState();
}

class _Health_Record_ScreenState extends State<Health_Record_Screen> {
  File? galleryFile;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Health Records',
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
              CircleAvatar(
                radius: 80,
                backgroundColor: Color.fromRGBO(178, 216, 216, 1),
                // radius: 20,
                child: Icon(
                  Icons.cloud_upload_outlined,
                  size: 95,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Upload your health record to get started",
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: "sans",
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 13,
              ),
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
                                  "Upload from gallery",
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
                                        left: 20,
                                        right: 20,
                                        top: 13,
                                        bottom: 13),
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
                                      left: 40,
                                      right: 40,
                                      top: 13,
                                      bottom: 13,
                                    ),
                                  ),
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color.fromRGBO(
                                      0,
                                      128,
                                      128,
                                      1.0,
                                    ),
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
                                    fontSize: 15,
                                  ),
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  padding: MaterialStatePropertyAll(
                                    EdgeInsets.only(
                                      left: 52,
                                      right: 52,
                                      top: 13,
                                      bottom: 13,
                                    ),
                                  ),
                                  backgroundColor: MaterialStatePropertyAll(
                                    Colors.white,
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
                  "Upload Records",
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'sans', fontSize: 15),
                ),
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.only(left: 30, right: 30, top: 11, bottom: 11),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromRGBO(0, 128, 128, 1),
                  ),
                ),
              ),
              SizedBox(
                height: 110,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Learn more about how ",
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: "sans",
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Chemist manage your data",
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: "sans",
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
