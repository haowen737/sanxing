import 'package:flutter/material.dart';

class TextHero extends StatelessWidget {

  TextHero({
    @required this.tag,
    @required this.item,
    @optionalTypeArgs this.style,
    @optionalTypeArgs this.padding,
  });

  final String item;
  final String tag;
  final TextStyle style;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Padding(
        padding: padding,
        child: Text(
          item,
          style: style
        )));
  }
}
