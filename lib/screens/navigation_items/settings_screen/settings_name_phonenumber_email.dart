import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/settings_screen_card.dart';

class Settings_Name_PhoneNumber_screen extends StatefulWidget {
  const Settings_Name_PhoneNumber_screen({Key? key}) : super(key: key);

  @override
  State<Settings_Name_PhoneNumber_screen> createState() =>
      _Settings_Name_PhoneNumber_screenState();
}

class _Settings_Name_PhoneNumber_screenState
    extends State<Settings_Name_PhoneNumber_screen> {
  // Create a text editing controller for the email field
  final TextEditingController emailController = TextEditingController();

// Create a text editing controller for the name field
  final TextEditingController nameController = TextEditingController();

// Create a form for the user to enter their email and name
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Name, Phone Numbers, Email",
            style: TextStyle(
                fontFamily: "sans", color: Colors.black, fontSize: 18),
          ),
          elevation: 0,
          backgroundColor: Color.fromRGBO(242, 242, 246, 1),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Color.fromRGBO(242, 242, 246, 1),
        body: ListView(
          padding: EdgeInsets.only(top: 10, left: 12, right: 12),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 2, right: 2),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color.fromRGBO(255, 255, 255, 1)),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // Call the function to update the user's email and name in Firestore
                            updateUserEmailAndName(
                                emailController.text, nameController.text);
                          }
                        },
                        child: Text('Save'),
                      ),
                    ],
                  ),
                ),
                // child: const SettingsCard(
                //   label: 'Offers',
                //   iconImage:
                //       'assets/images/setting_screen_icons/decoration.png',
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Update the user's email and name in Firestore
  Future<void> updateUserEmailAndName(String email, String name) async {
    // Get the currently signed-in user from Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Create a reference to the Firestore document for the current user
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(user.uid);

      // Update the user's email and name fields in Firestore
      await userRef.update({
        'email': email,
        'name': name,
      });
    }
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;

void updateProfile(String displayName, String email) async {
  User? user = _auth.currentUser;

  // Update the user's profile display name
  await user!.updateDisplayName(displayName);

  // Update the user's email address
  await user.updateEmail(email);

  // Update the user's data in Firestore
  await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
    'displayName': displayName,
    'email': email,
  }, SetOptions(merge: true));
}
