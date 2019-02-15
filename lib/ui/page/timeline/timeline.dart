import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sanxing/ui/widgets/weekNotice.dart';
import 'package:sanxing/utils/weekName.dart';
import 'package:sanxing/ui/page/tasks/tasks.dart';

class Timeline extends StatelessWidget {
  Widget activityTile(String name) => Container(
    color: Colors.green,
    margin: EdgeInsets.all(0.5),
    child: Text(name)
  );

  Widget _activityGrid(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final List<Widget> tileSet = weekSetShort.map((n) => activityTile(n)).toList();

    return Container(
      height: deviceSize.height - 500,
      color: Colors.blue,
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 15, color: Color.fromRGBO(0, 0, 0, 1)),
        child: GridView.count(
          crossAxisCount: 7,
          children: tileSet)));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: SizedBox.expand(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                WeekNotice(),
                _activityGrid(context),
              ]),
            Tasks()
          ])));
  }
}