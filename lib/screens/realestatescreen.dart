import 'package:flutter/material.dart';
import 'package:realestateapp/custom/border_box.dart';
import 'package:realestateapp/custom/option_button.dart';
import 'package:realestateapp/utilis/constants.dart';
import 'package:realestateapp/utilis/custom_functions.dart';
import 'package:realestateapp/utilis/sample_data.dart';
import 'package:realestateapp/utilis/widget_functions.dart';

class RealEstateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double _padding = 25.0;
    final dynamic itemData = RE_DATA[2];
    final _sidepadding = EdgeInsets.symmetric(
      horizontal: _padding,
    );

    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                flexibleSpace: FlexibleSpaceBar(
                  background: Image(
                    image: AssetImage(itemData["image"]),
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                pinned: true,
                expandedHeight: size.width * 0.5,
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Column(
                  children: [
                    Column(
                      children: [
                        addVerticalSpace(25),
                        Padding(
                          padding: _sidepadding,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    formatCurrency(itemData["amount"]),
                                    style: themeData.textTheme.headline1,
                                  ),
                                  Text(
                                    itemData["address"],
                                    style: themeData.textTheme.bodyText2,
                                  ),
                                ],
                              ),
                              BorderBox(
                                  width: 125,
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "20 Hours ago",
                                      style: themeData.textTheme.headline5,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    addVerticalSpace(30),
                    Padding(
                      padding: _sidepadding,
                      child: Row(
                        children: [
                          Text(
                            "House information",
                            style: themeData.textTheme.headline4,
                          ),
                        ],
                      ),
                    ),
                    addVerticalSpace(10),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: buildProperities(itemData)),
                    ),
                    addVerticalSpace(25),
                    Padding(
                      padding: _sidepadding,
                      child: Text(itemData["description"]),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ])),
            ],
          ),
          Positioned(
              bottom: 20,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OptionButton(
                    text: "Message",
                    icon: Icons.message,
                  ),
                  addHorizontalSpace(25),
                  OptionButton(
                    text: "Call",
                    icon: Icons.call,
                  )
                ],
              )),
          Positioned(
            child: Padding(
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
                    ),
                    onPressed: () {},
                  ),
                  BorderBox(
                    width: 50,
                    height: 50,
                    child: const Icon(
                      Icons.favorite_outline,
                      color: color_black,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

List<Widget> buildProperities(dynamic itemData) {
  List<Widget> list = [
    itemData["bathrooms"],
    itemData["bedrooms"],
    itemData["area"],
    itemData["garage"],
  ]
      .map((properties) => HouseProperties(
            text: properties,
          ))
      .toList();

  return list;
}

class HouseProperties extends StatelessWidget {
  final int? text;
  final String? subtext;

  const HouseProperties({
    Key? key,
    this.text,
    this.subtext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color_white,
            border: Border.all(color: color_grey.withAlpha(40), width: 2),
          ),
          margin: const EdgeInsets.only(left: 25),
          child: Center(
            child: Text(
              text.toString(),
              style: themeData.textTheme.headline1,
            ),
          ),
        ),
        addVerticalSpace(10),
        Text(
          subtext ?? "No subtext ?",
          style: themeData.textTheme.headline5,
        ),
      ],
    );
  }
}
