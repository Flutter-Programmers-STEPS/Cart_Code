// import 'package:flutter/material.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String _phoneNumber = '';
//
//   bool _validatePhoneNumber() {
//     RegExp regex = RegExp(r'^([+][0-9]{1,3}|0)?[0-9]{10}$');
//     return regex.hasMatch(_phoneNumber);
//   }
//
//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       // Form is valid, proceed with login
//       // You can add your login logic here
//       print('Phone number: $_phoneNumber');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Page'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Phone Number',
//                   hintText: 'Enter your phone number',
//                 ),
//                 keyboardType: TextInputType.phone,
//                 validator: (String? value) {
//                   _phoneNumber = value ?? '';
//                   if (!_validatePhoneNumber()) {
//                     return 'Invalid phone number';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: _submitForm,
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//

import 'package:chemist_io3/screens/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'navigation_items/navigation_bar.dart';
import 'navigation_items/settings_screen/settings_screen.dart';

class Login_page extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _phoneNumber = '';

  bool _validatePhoneNumber() {
    RegExp regex = RegExp(r'^([+][0-9]{1,3}|0)?[0-9]{10}$');
    return regex.hasMatch(_phoneNumber);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, navigate to home page
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(top: 250, left: 20, right: 20),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 0),
              child: const Text(
                "LOGIN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Urbanist",
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 6, top: 8),
              child: const Text(
                "Enter your phone number to proceed",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Urbanist",
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefix: Text(
                          '+91',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        labelStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                        labelText: 'PHONE NUMBER',
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (String? value) {
                        _phoneNumber = value ?? '';
                        if (!_validatePhoneNumber()) {
                          return 'Enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 15),
                      child: SizedBox(
                        width: 360,
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
                                (states) => Color.fromRGBO(0, 128, 128, 1.0)),
                          ),
                          // onPressed: _submitForm,
                          // onPressed: _submitForm,
                          onPressed: _submitForm,
                          // onPressed: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Navigation_Bar()),
                          //   );
                          // },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'CONTINUE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "lexend",
                                  fontSize: 16.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 10),
                      child: const Text(
                        "By clicking, i accept the Terms & conditions & Privacy Policy",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Urbanist",
                          fontSize: 11,
                        ),
                      ),
                    ),
                    Padding(
                        child: Text(
                          "OR",
                          style: TextStyle(fontFamily: "lexend"),
                        ),
                        padding: EdgeInsets.only(top: 6, bottom: 1)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "New to Chemist?",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "lexend",
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signup_page()),
                            );
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(0, 128, 128, 1.0),
                              fontFamily: "lexend",
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
