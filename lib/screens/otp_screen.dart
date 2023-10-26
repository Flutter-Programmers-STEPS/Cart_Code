import 'package:chemist_io3/screens/reset_password_screen.dart';
import 'package:flutter/material.dart';

class Otp_Screen extends StatelessWidget {
  const Otp_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25, bottom: 0, left: 25, right: 20),
              child: Text(
                "we have sent you \nan OTP",
                style: TextStyle(
                    fontFamily: "Sans",
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 14, bottom: 0, left: 25, right: 25),
              child: Text(
                "enter the 4 digit OTP \nsend on +91 XXXXXXXX to proceed",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    fontFamily: "Sans"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 14, bottom: 0, left: 25, right: 25),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey, fontFamily: 'Sans'),
                  icon: Icon(Icons.lock_clock_outlined),
                  labelText: '0000',
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
                        (states) => const Color.fromRGBO(0, 128, 128, 1.0)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Reset_Password_Screen()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'continue',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Sans',
                            fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 0, left: 25, right: 25),
              child: Row(
                children: [
                  const Text(
                    "didn't recevie OTP?",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        fontFamily: "Sans"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Resend OTP",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          fontFamily: "Sans"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
