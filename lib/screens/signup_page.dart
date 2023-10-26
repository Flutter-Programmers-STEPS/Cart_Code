import 'package:chemist_io3/screens/phone%20number%20auth/phone_login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'google/authentication/googleee.dart';
import 'navigation_items/navigation_bar.dart';

class signup_page extends StatefulWidget {
  const signup_page({Key? key}) : super(key: key);

  @override
  State<signup_page> createState() => _signup_pageState();
}

class _signup_pageState extends State<signup_page> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: const EdgeInsets.only(top: 50),
          children: [
            Container(
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "chemist",
                      style: TextStyle(
                        fontFamily: "Monts",
                        fontSize: 52,
                        color: Color.fromRGBO(0, 128, 128, 1.0),
                      ),
                    ),
                    const Text(
                      'An app just made for health care',
                      style: TextStyle(
                          fontFamily: "lexend",
                          fontSize: 12,
                          color: Colors.black),
                    ),
                    const Image(
                      image: AssetImage('assets/images/my_project.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: SizedBox(
                        width: 330,
                        height: 45,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: const BorderSide(
                                    width: 1, color: Colors.grey),
                              ),
                            ),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Colors.white),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.apple, color: Colors.black87),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Continue with Apple',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'lexend'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            width: 155,
                            height: 45,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: const BorderSide(
                                        width: 1, color: Colors.blueAccent),
                                  ),
                                ),
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.white),
                              ),
                              onPressed: () {},
                              child: Center(
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(Icons.facebook_outlined,
                                        color: Colors.blue),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      'Facebook',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontFamily: 'lexend'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SizedBox(
                            width: 155,
                            height: 45,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: const BorderSide(
                                        width: 1, color: Colors.redAccent),
                                  ),
                                ),
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.white),
                              ),
                              onPressed: () async {
                                // Get the user data from Firestore and update the user object
                                Future<void> updateUserData() async {
                                  // Get the current user ID
                                  String uid =
                                      FirebaseAuth.instance.currentUser!.uid;

                                  // Get the user data from Firestore
                                  DocumentSnapshot snapshot =
                                      await FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(uid)
                                          .get();
                                  Map<String, dynamic> data =
                                      snapshot.data() as Map<String, dynamic>;

                                  // Update the user object with the new data
                                  User? user =
                                      FirebaseAuth.instance.currentUser;
                                  if (user != null) {
                                    user.updateDisplayName(data['name']);
                                    user.updateEmail(data['email']);
                                  }
                                }

                                try {
                                  final GoogleSignInAccount? googleUser =
                                      await googleSignIn.signIn();
                                  final GoogleSignInAuthentication googleAuth =
                                      await googleUser!.authentication;

                                  final AuthCredential credential =
                                      GoogleAuthProvider.credential(
                                    accessToken: googleAuth.accessToken,
                                    idToken: googleAuth.idToken,
                                  );

                                  final UserCredential userCredential =
                                      await FirebaseAuth.instance
                                          .signInWithCredential(credential);
                                  final User? user = userCredential.user;

                                  if (user != null) {
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(user.uid)
                                        .set({
                                      'name': user.displayName,
                                      'email': user.email,
                                      'photoUrl': user.photoURL,
                                    });
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return Navigation_Bar();
                                        },
                                      ),
                                    );
                                  }
                                } catch (error) {
                                  print(error);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.teal,
                                      duration: Duration(seconds: 3),
                                      content: Text('Google Sign-in failed :('),
                                    ),
                                  );
                                }
                              },
                              child: Center(
                                child: Row(
                                  children: const [
                                    SizedBox(
                                      width: 22,
                                    ),
                                    SizedBox(
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/signup_logos/google-logo.png'),
                                      ),
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      'Google',
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                          fontFamily: 'lexend'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: SizedBox(
                        width: 330,
                        height: 45,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: const BorderSide(
                                    width: 1, color: Colors.grey),
                              ),
                            ),
                            backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromRGBO(0, 128, 128, 1.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Phone_Login_page();
                                },
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Continue with Phone',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'lexend'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Center(
                        child: SizedBox(
                          width: 310,
                          height: 40,
                          child: Text(
                            textAlign: TextAlign.center,
                            "By continuing you agree Chemist's terms of Services & Privacy Policy",
                            style: TextStyle(
                                fontFamily: 'lexend',
                                color: Colors.grey,
                                fontSize: 13),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//   Future<void> _signInWithGoogle() async {
//     setState(() {
//       _isSigningIn = true;
//     });
//
//     try {
//       final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser!.authentication;
//
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//       final UserCredential userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);
//       final User? user = userCredential.user;
//
//       if (user != null) {
//         await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
//           'name': user.displayName,
//           'email': user.email,
//           'photoUrl': user.photoURL,
//         });
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) {
//               return Navigation_Bar();
//             },
//           ),
//         );
//       }
//     } catch (error) {
//       print(error);
//       // Show sign-in failed message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Sign-in failed'),
//         ),
//       );
//     } finally {
//       setState(() {
//         _isSigningIn = false;
//       });
//     }
//   }
// }
