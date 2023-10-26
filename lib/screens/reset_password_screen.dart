import 'package:flutter/material.dart';

class Reset_Password_Screen extends StatelessWidget {
  const Reset_Password_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Image(
              image: AssetImage("assets/images/resetpasswordimage.png"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 0, left: 25, right: 20),
              child: Text(
                "Reset \nPassword",
                style: TextStyle(
                    fontFamily: "lexend",
                    fontSize: 35,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18, bottom: 0, left: 25, right: 25),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelStyle:
                      TextStyle(color: Colors.grey, fontFamily: 'lexend'),
                  icon: Icon(Icons.lock_clock_outlined),
                  labelText: 'New password',
                ),
                onSaved: (String? value) {},
                validator: (String? value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18, bottom: 0, left: 25, right: 25),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelStyle:
                      TextStyle(color: Colors.grey, fontFamily: 'lexend'),
                  icon: Icon(Icons.lock_clock_outlined),
                  labelText: 'Confirm new password',
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
                  onPressed: () {},
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
