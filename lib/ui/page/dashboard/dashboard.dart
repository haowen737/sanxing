import 'package:flutter/material.dart';
import 'package:sanxing/ui/page/task_list/task_list.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TaskList()
    );
  }
}
