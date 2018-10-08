import 'package:flutter/material.dart';
// import 'dart:collection';
import 'package:flutter/foundation.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> with SingleTickerProviderStateMixin {
  
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      color: Theme.of(context).backgroundColor,
      width: deviceSize.width,
      height: deviceSize.height,
      child: Column(
        children: <Widget>[
          TaskHeader(),
          Flexible(child: Task())
        ]
      )
    );
  }
}

class TaskHeader extends StatelessWidget {
  final now = DateTime.now();

  @override
  Widget build(BuildContext context){
    return Container(
      child: Row(children: <Widget>[
        Text(now.day.toString())
      ],)
    );
  }
}

class Task extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final deviceSize = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
          ),
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
          padding: const EdgeInsets.all(10.0),
          width: deviceSize.width - 20,
          child: Text('child')
        );
      }
    );
  }
}