import 'package:flutter/material.dart';
import 'package:sanxing/ui/page/dashboard/dashboard.dart';
import 'package:sanxing/ui/page/timeline/timeline.dart';
import 'package:sanxing/ui/page/home/home.dart';
import 'package:sanxing/utils/routedata.dart';
import 'package:sanxing/ui/page/taskDetail/task_detail.dart';

class App extends StatelessWidget {

  final app = MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      backgroundColor: Colors.white,
    ),
    home: Home(),
    routes: <String, WidgetBuilder>{
      RouteCollect.home: (BuildContext context) => Home(),
      RouteCollect.timeline: (BuildContext context) => Timeline(),
    },
  );

  @override
  Widget build(BuildContext context) {
    return app;
  }
}
