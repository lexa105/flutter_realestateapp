import 'package:flutter/material.dart';
import 'package:realestateapp/utilis/constants.dart';

class BorderBox extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding; //vnitrek
  final double width, height;
  final VoidCallback? onPressed;

  const BorderBox({
    Key? key,
    this.padding,
    required this.width,
    required this.height,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _style = ElevatedButton.styleFrom(
      primary: color_white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      side: BorderSide(
        width: 2,
        color: color_grey.withAlpha(40),
      ),
      fixedSize: Size(height, width),
      padding: padding ?? const EdgeInsets.all(8.0),
    );
    /*return ElevatedButton(
      onPressed: onPressed,
      style: _style,
      child: Center(child: child),
    );*/

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color_white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color_grey.withAlpha(40), width: 2),
      ),
      padding: padding ?? const EdgeInsets.all(8.0),
      child: InkWell(
        child: child,
        onTap: onPressed,
      ),
    );
  }
}
