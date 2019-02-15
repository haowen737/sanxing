import 'package:flutter/material.dart';

class TaskTileHero extends StatelessWidget {

  TaskTileHero({
    @required this.tag,
    @required this.child,
  });

  final Object tag;
  final Widget child;

  static String buildTag(String flag) {
    return 'hero-task-$flag';
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: child,
    );
  }
}
