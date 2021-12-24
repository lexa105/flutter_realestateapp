// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:realestateapp/custom/border_box.dart';
import 'package:realestateapp/utilis/constants.dart';
import 'package:realestateapp/utilis/sample_data.dart';
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
              addVerticalSpace(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: buildChoiceOption(),
                ),
              ),
              addVerticalSpace(10),
              Expanded(
                child: Padding(
                  padding: sidePadding,
                  child: ListView.builder(
                    itemCount: RE_DATA.length,
                    itemBuilder: (context, index) {
                      return RealEstateItem(itemData: RE_DATA[index]);
                    },
                  ),
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
  List<Widget> list = ["<\$220,000", "For Sale", "3-4 Beds", ">5000m2", "nigga"]
      .map((filter) => ChoiceOption(text: filter))
      .toList();
  return list;
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: color_grey.withAlpha(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 25),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(itemData["image"])),
              Positioned(
                  top: 15,
                  right: 15,
                  child: BorderBox(
                    width: 50,
                    height: 50,
                    child: const Icon(
                      Icons.favorite_border,
                      color: color_black,
                    ),
                  )),
            ],
          ),
          addVerticalSpace(15),
          Row(
            children: [
              Text(
                "${itemData["amount"]}",
                style: themeData.textTheme.headline1,
              )
            ],
          )
        ],
      ),
    );
  }
}
