import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../google/authentication/googleee.dart';
import 'about_screen.dart';
import 'settings_profile_page_screen.dart';
import '../../signup_page.dart';
import '../../widgets/settings_screen_card.dart';
import '../home_screen/home_screen.dart';
import '../home_screen/reports/reports_screen.dart';

class account_screen extends StatefulWidget {
  static final id = "act";
  const account_screen({Key? key}) : super(key: key);

  @override
  State<account_screen> createState() => _account_screenState();
}

class _account_screenState extends State<account_screen> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(242, 242, 246, 1),
          // shadowColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: const Color.fromRGBO(242, 242, 246, 1),
        body: ListView(
          padding: const EdgeInsets.only(left: 16, right: 16),
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 5, bottom: 8),
              child: Text(
                "Settings",
                style: TextStyle(
                  fontFamily: "Sans",
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile_page()),
                );
              },
              child: Card(
                  shadowColor: const Color.fromRGBO(255, 255, 255, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: (getPhotoUrl != null)
                      ? Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                child: Icon(
                                  Icons.account_circle_rounded,
                                  size: 50,
                                ),
                                backgroundColor: Colors.transparent,
                                radius: 23,
                              ),
                              title: Text(
                                'USER',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "Sans",
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  const Text(
                                    'Health Details, ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontFamily: "Sans",
                                    ),
                                  ),
                                  const Text(
                                    'Personal Info',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontFamily: "Sans",
                                    ),
                                  )
                                ],
                              ),
                              trailing: const Icon(
                                size: 12,
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            ),
                          ], //this loads when the user dont sign in with google
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 23,
                                backgroundImage: NetworkImage(
                                  getPhotoUrl(),
                                ),
                              ),
                              title: Text(
                                getDisplayName(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "Sans",
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  const Text(
                                    'Health Details, ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontFamily: "Sans",
                                    ),
                                  ),
                                  const Text(
                                    'Personal Info',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontFamily: "Sans",
                                    ),
                                  )
                                ],
                              ),
                              trailing: const Icon(
                                size: 12,
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 2, right: 2),
              child: Container(
                padding: const EdgeInsets.all(2),
                alignment: Alignment.center,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromRGBO(255, 255, 255, 1)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger(
                          child: Text("No Orders Found"),
                        );
                      },
                      child: const SettingsCard(
                        // onTTap: () {},
                        label: 'My Orders',
                        iconImage:
                            'assets/images/setting_screen_icons/completed-task.png',
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Reports_Screen();
                            },
                          ),
                        );
                      },
                      child: const SettingsCard(
                        label: 'Reports',
                        iconImage:
                            'assets/images/setting_screen_icons/document.png',
                      ),
                    ),
                    const Divider(),
                    const SettingsCard(
                      label: 'Health Statics',
                      iconImage:
                          'assets/images/setting_screen_icons/analytics.png',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 2, right: 2),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromRGBO(255, 255, 255, 1)),
                child: const SettingsCard(
                  label: 'Offers',
                  iconImage:
                      'assets/images/setting_screen_icons/decoration.png',
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20, left: 2, right: 2, bottom: 20),
              child: Container(
                padding: const EdgeInsets.all(2),
                alignment: Alignment.center,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromRGBO(255, 255, 255, 1)),
                child: Column(
                  children: [
                    const SettingsCard(
                      label: 'Notifications',
                      iconImage: 'assets/images/setting_screen_icons/chat.png',
                    ),
                    const Divider(),
                    const SettingsCard(
                      label: 'Feedback',
                      iconImage:
                          'assets/images/setting_screen_icons/feedback.png',
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return About_screen();
                            },
                          ),
                        );
                      },
                      child: const SettingsCard(
                        label: 'About',
                        iconImage:
                            'assets/images/setting_screen_icons/info.png',
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () {
                        signOutGoogle();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                          return const signup_page();
                        }), ModalRoute.withName('/'));
                      },
                      child: const SettingsCard(
                        label: 'Logout',
                        iconImage:
                            'assets/images/setting_screen_icons/logout.png',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: Center(
                child: Text(
                  "chemist",
                  style: TextStyle(
                      fontFamily: "Monts", fontSize: 22, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
