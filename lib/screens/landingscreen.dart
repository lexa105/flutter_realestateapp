// ignore: file_names
import 'package:flutter/material.dart';
import 'package:realestateapp/custom/border_box.dart';
import 'package:realestateapp/custom/option_button.dart';
import 'package:realestateapp/utilis/constants.dart';
import 'package:realestateapp/utilis/custom_functions.dart';
import 'package:realestateapp/utilis/sample_data.dart';
import 'package:realestateapp/utilis/widget_functions.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        drawer: SideBar(),
        body: Container(
            height: size.height,
            child: Stack(
              children: [
                Column(
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
                            onPressed: () {},
                          ),
                          BorderBox(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.settings,
                              color: color_black,
                            ),
                            onPressed: () {},
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
                        "Neratovice",
                        style: themeData.textTheme.headline1,
                      ),
                    ),
                    const Padding(
                        padding: sidePadding,
                        child: Divider(
                          height: padding,
                          color: color_grey,
                        )),
                    addVerticalSpace(10),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
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
                          physics: const BouncingScrollPhysics(),
                          itemCount: RE_DATA.length,
                          itemBuilder: (context, index) {
                            return RealEstateItem(itemData: RE_DATA[index]);
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                    bottom: 20,
                    width: size.width,
                    child: Center(
                      child: OptionButton(
                        icon: Icons.map_rounded,
                        text: "Map View",
                        width: size.width * 0.4,
                      ),
                    )),
              ],
            )),
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    onPressed: () {},
                  )),
            ],
          ),
          addVerticalSpace(15),
          Row(
            children: [
              Text(
                formatCurrency(itemData["amount"]),
                style: themeData.textTheme.headline1,
              ),
              addHorizontalSpace(10),
              Text(
                "${itemData["address"]}",
                style: themeData.textTheme.bodyText2,
              ),
            ],
          ),
          addVerticalSpace(10),
          Text(
            "${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} m2",
            style: themeData.textTheme.headline5,
          ),
          addVerticalSpace(5),
          //ElevatedButton(onPressed: () {}, child: Text("View More")),
        ],
      ),
    );
  }
}

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themedata = Theme.of(context);
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                "Real Estates",
                style: _themedata.textTheme.headline1,
              ),
            ),
            ListTile(
              title: Text("Ahoj"),
            ),
          ],
        ),
      ),
    );
  }
}
