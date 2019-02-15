import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sanxing/ui/widgets/taskTileHero.dart';
import 'package:sanxing/ui/widgets/taskTile.dart';
import 'package:sanxing/ui/page/tasks/tasks_transformer.dart';

class TaskDetail extends StatefulWidget {
  TaskDetail({
    @required this.index,
    @required this.item,
    @required this.pageVisibility,
  });

  final String item;
  final index;
  final PageVisibility pageVisibility;

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
        // backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        child: TaskTileHero(
          tag: TaskTileHero.buildTag(widget.item),
          child: TaskTile(
            item: widget.item,
            index: widget.index,
            pageVisibility: widget.pageVisibility,
          ))));
  }
}
