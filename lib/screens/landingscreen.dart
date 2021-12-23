// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:realestateapp/custom/border_box.dart';
import 'package:realestateapp/utilis/constants.dart';
import 'package:realestateapp/utilis/widget_functions.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(padding),
              Padding(
                padding: sidePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BorderBox(
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.menu,
                        color: color_black,
                      ),
                    ),
                    BorderBox(
                      height: 50,
                      width: 50,
                      child: Icon(
                        Icons.settings,
                        color: color_black,
                      ),
                    ),
                  ],
                ),
              ),
              addVerticalSpace(padding),
              Padding(
                padding: sidePadding,
                child: Text(
                  "City",
                  style: themeData.textTheme.bodyText2,
                ),
              ),
              addVerticalSpace(10),
              Padding(
                padding: sidePadding,
                child: Text(
                  "Los Angeles",
                  style: themeData.textTheme.headline1,
                ),
              ),
              Padding(
                  padding: sidePadding,
                  child: Divider(
                    height: padding,
                    color: color_grey,
                  )),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: buildChoiceOption(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> buildChoiceOption() {
  List<Widget> list = [
    ChoiceOption(text: "Student-friendly"),
    ChoiceOption(text: "Family"),
    ChoiceOption(text: "<200,000USD"),
    ChoiceOption(text: "<200,000USD"),
    ChoiceOption(text: "<200,000USD"),
    ChoiceOption(text: "<200,000USD"),
  ];
  return list;
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: color_grey.withAlpha(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      child: Text(text),
    );
  }
}
