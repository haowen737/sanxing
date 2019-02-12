import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Calendar(
        isExpandable: true,
      )
    );
  }
}