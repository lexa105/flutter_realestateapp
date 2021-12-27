import 'package:flutter/material.dart';
import 'package:realestateapp/custom/border_box.dart';
import 'package:realestateapp/utilis/constants.dart';
import 'package:realestateapp/utilis/sample_data.dart';
import 'package:realestateapp/utilis/widget_functions.dart';

class RealEstateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double _padding = 25.0;
    final _sidepadding = EdgeInsets.symmetric(horizontal: _padding);
    final dynamic realestatenumber = RE_DATA[1]["image"];
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(realestatenumber),
                Padding(
                  padding: _sidepadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BorderBox(
                          width: 50,
                          height: 50,
                          child: const Icon(
                            Icons.arrow_back,
                            color: color_black,
                          )),
                      BorderBox(
                          width: 50,
                          height: 50,
                          child: const Icon(
                            Icons.favorite_outline,
                            color: color_black,
                          )),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
