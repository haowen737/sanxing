import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TaskDetail extends StatefulWidget {
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: CupertinoPageScaffold(
        child: Text('nice new page')
      ));
  }
}
