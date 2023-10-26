import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final String label;
  final String iconImage;
  final Function()? onTTap;

  const SettingsCard(
      {Key? key, required this.label, required this.iconImage, this.onTTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 3),
      child: Container(
        padding: const EdgeInsets.only(right: 14, left: 14),
        height: 37,
        decoration:
            const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
        child: Row(
          children: [
            SizedBox(
              width: 270,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SizedBox(
                      width: 19,
                      height: 19,
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          iconImage,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 2),
                    child: Text(
                      label,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: "Sans",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Icon(
                size: 12,
                Icons.arrow_forward_ios,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
