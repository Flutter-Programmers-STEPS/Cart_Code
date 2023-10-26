import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../authentication/googleee.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: _isSigningIn
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: _signInWithGoogle,
                child: Text('Sign in with Google'),
              ),
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isSigningIn = true;
    });

    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        // Save user info on Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': user.displayName,
          'email': user.email,
          'photoUrl': user.photoURL,
        });
      }
    } catch (error) {
      print(error);
    } finally {
      setState(() {
        _isSigningIn = false;
      });
    }
  }
}

// GPT working code that stores user data on firestore

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             try {
//               final GoogleSignInAccount? googleUser =
//                   await googleSignIn.signIn();
//               final GoogleSignInAuthentication googleAuth =
//                   await googleUser!.authentication;
//
//               final AuthCredential credential = GoogleAuthProvider.credential(
//                 accessToken: googleAuth.accessToken,
//                 idToken: googleAuth.idToken,
//               );
//
//               final UserCredential userCredential =
//                   await FirebaseAuth.instance.signInWithCredential(credential);
//               final User? user = userCredential.user;
//
//               if (user != null) {
//                 // Save user info on Firestore
//                 await FirebaseFirestore.instance
//                     .collection('users')
//                     .doc(user.uid)
//                     .set({
//                   'name': user.displayName,
//                   'email': user.email,
//                   'photoUrl': user.photoURL,
//                 });
//               }
//             } catch (error) {
//               print(error);
//             }
//           },
//           child: Text('Sign in with Google'),
//         ),
//       ),
//     );
//   }
// }

// /*
// import 'package:chemist_io3/screens/google/screeens/profile_page.dart';
// import 'package:flutter/material.dart';
//
// import '../authentication/googleee.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               FlutterLogo(size: 150),
//               SizedBox(height: 50),
//               OutlinedButton(
//                 onPressed: () {
//                   signInWithGoogle().then((result) {
//                     if (result != null) {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return Profile_Page();
//                           },
//                         ),
//                       );
//                     }
//                   });
//                 },
//                 child: Padding(
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       // Image(
//                       //     image: AssetImage("assets/google_logo.png"),
//                       //     height: 35.0),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: Text(
//                           'Sign in with Google',
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   padding: EdgeInsets.all(10),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// */
