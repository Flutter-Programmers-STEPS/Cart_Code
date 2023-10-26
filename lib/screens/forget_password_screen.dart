import 'package:flutter/material.dart';

import 'otp_screen.dart';

class Forget_password_screen extends StatelessWidget {
  const Forget_password_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Image(
              image: AssetImage("assets/images/forgetpassimage2.jpg"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 0, left: 25, right: 20),
              child: Text(
                "Forgot \nPassword?",
                style: TextStyle(
                    fontFamily: "lexend",
                    fontSize: 35,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 14, bottom: 0, left: 25, right: 25),
              child: Text(
                "Dont worry! it happens. Please enter the \naddress associated with your account",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    fontFamily: "lexend"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18, bottom: 0, left: 25, right: 25),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelStyle:
                      TextStyle(color: Colors.grey, fontFamily: 'lexend'),
                  icon: Icon(Icons.lock_clock_outlined),
                  labelText: 'Email ID / Mobile number',
                ),
                onSaved: (String? value) {},
                validator: (String? value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 25, bottom: 20, left: 25, right: 25),
              child: SizedBox(
                width: 330,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: const BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Otp_Screen()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Submit',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'lexend'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
