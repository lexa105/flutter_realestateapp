import 'package:flutter/material.dart';
import 'dart:ui';
import 'utilis/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Episode 1',
      theme: ThemeData(
          textTheme: screenWidth < 500 ? texttheme_default : texttheme_small,
          fontFamily: "Montserrat"),
      home: LandingPage(),
    );
  }
}
