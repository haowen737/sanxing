import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanxing/utils/routedata.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Text('This is home', style: Theme.of(context).textTheme.display1),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteCollect.timeline);
            },
            child: Text('click to jump'),
          )
        ]
      ),
    );
  }
}