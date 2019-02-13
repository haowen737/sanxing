import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sanxing/ui/widgets/weekNotice.dart';
import 'package:sanxing/utils/weekName.dart';
import 'package:sanxing/ui/page/timeline/timeline_gallary.dart';

class Timeline extends StatelessWidget {
  Widget activityTile(String name) => Container(
    color: Colors.green,
    margin: EdgeInsets.all(5.0),
    child: Text(name)
  );

  Widget activityGrid(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final List<Widget> tileSet = weekSet.map((n) => activityTile(n)).toList();

    return Container(
      height: deviceSize.height - 500,
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 15, color: Color.fromRGBO(0, 0, 0, 1)),
        child: GridView.count(
          crossAxisCount: 4,
          children: tileSet)));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          WeekNotice(),
          activityGrid(context),
          Gallary()
        ]));
  }
}