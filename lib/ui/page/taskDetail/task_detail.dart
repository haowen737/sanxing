import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TaskDetail extends StatefulWidget {
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Text('nice new page')
    );
  }
}
