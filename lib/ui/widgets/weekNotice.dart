import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekNotice extends StatelessWidget {

  Widget weekNumber() => Container(
    child: Text('第x周'));

  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Container(
      padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 15, color: Color.fromRGBO(0, 0, 0, 1)),
        child: Row(children: <Widget>[
          weekNumber(),
          Text(DateFormat('yyyy-MM-DD').format(DateTime.now())),
        ]))));
  }
}