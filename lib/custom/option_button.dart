import 'package:flutter/material.dart';
import 'package:realestateapp/utilis/constants.dart';
import 'package:realestateapp/utilis/widget_functions.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final double? width;

  const OptionButton({Key? key, required this.text, this.icon, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _buttonstyle = ElevatedButton.styleFrom(
      primary: color_dark_blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    );
    return Container(
      width: width,
      child: ElevatedButton(
        style: _buttonstyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color_white),
            addHorizontalSpace(10),
            Text(
              text,
              style: const TextStyle(
                color: color_white,
              ),
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
