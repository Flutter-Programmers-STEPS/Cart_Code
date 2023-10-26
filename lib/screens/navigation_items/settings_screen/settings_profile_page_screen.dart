import 'package:chemist_io3/screens/navigation_items/settings_screen/settings_name_phonenumber_email.dart';
import 'package:chemist_io3/screens/widgets/Profile_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../google/authentication/googleee.dart';

class Profile_page extends StatefulWidget {
  const Profile_page({Key? key}) : super(key: key);

  @override
  State<Profile_page> createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  String getDisplayName() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.displayName ?? '';
    } else {
      return '';
    }
  }

  String getPhotoUrl() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.photoURL ?? '';
    } else {
      return '';
    }
  }

  String getEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.email ?? '';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(242, 242, 246, 1),
        body: ListView(
          padding: EdgeInsets.only(top: 70, left: 16, right: 16),
          children: [
            Center(
                child: (getPhotoUrl != null)
                    ? Column(
                        children: [
                          CircleAvatar(
                            child: Icon(
                              Icons.account_circle_rounded,
                              size: 50,
                            ),
                            backgroundColor: Colors.transparent,
                            radius: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 7, bottom: 2.5),
                            child: Center(
                              child: Text(
                                "USER",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  fontFamily: "Sans",
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              fontFamily: 'Sans',
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 40,
                            backgroundImage: NetworkImage(
                              getPhotoUrl(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 7, bottom: 2.5),
                            child: Center(
                              child: Text(
                                getDisplayName(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  fontFamily: "Sans",
                                ),
                              ),
                            ),
                          ),
                          Text(
                            getEmail(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              fontFamily: 'Sans',
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 2, right: 2),
              child: Container(
                padding: EdgeInsets.all(2),
                alignment: Alignment.center,
                height: 255,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color.fromRGBO(255, 255, 255, 1)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Settings_Name_PhoneNumber_screen();
                            },
                          ),
                        );
                      },
                      child: Profile_Card(
                        label: 'Name, Phone Numbers, Email',
                      ),
                    ),
                    Divider(),
                    Profile_Card(
                      label: 'Passwords & Security',
                    ),
                    Divider(),
                    Profile_Card(
                      label: 'Payment information',
                    ),
                    Divider(),
                    Profile_Card(
                      label: 'Addresses',
                    ),
                    Divider(),
                    Profile_Card(
                      label: 'Payment & Refunds',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                padding: EdgeInsets.only(right: 14, left: 14),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 0, bottom: 2),
                      child: SizedBox(
                        width: 270,
                        child: Center(
                          child: Text(
                            'Delete account',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontFamily: "Sans",
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                height: 37,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
