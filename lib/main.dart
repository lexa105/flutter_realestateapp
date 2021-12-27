import 'package:flutter/material.dart';
import 'package:realestateapp/screens/landingscreen.dart';
import 'package:realestateapp/screens/realestatescreen.dart';
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
          textTheme: screenWidth < 500 ? texttheme_small : texttheme_default,
          fontFamily: "Montserrat"),
      home: LandingScreen(),
    );
  }
}
